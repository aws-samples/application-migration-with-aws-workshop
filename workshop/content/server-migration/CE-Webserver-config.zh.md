+++
title = "配置应用"
weight = 50

+++

### 配置 Web 服务器访问目标数据库

当切换完成后，**CloudEndure Migration** 已经在您的 AWS 账号中创建了一个 Web 服务器的运行实例。现在，您需要更新 Web 应用配置以便使用之前已经复制的 AWS RDS 数据库（在 **数据库迁移** 步骤中)。


1. 更新 **Web 服务器的安全组**

    a. 转到 **AWS 控制台 -> EC2**，点击左边菜单中的 **实例**，选择列表中的 Webserver  
    b. 记下 **公有 DNS (IPv4)** 地址和 **私有 IP**  
    c. 点击分配给它的安全组  

    ![Webserver details](/ce/webserver_details.zh.png)

    d. 修改安全组的入站规则，允许来自任何位置在端口 **80** 的流量 和 来自您的电脑在端口 **22** 的流量    

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.zh.png)

2. 登录到 CloudEndure 创建的 **Webserver**  

    使用与源环境相同的用户名 (ubuntu) 和 SSH .pem key。

    如果您不知道如何使用 SSH 访问服务器，请检查以下内容：
     - 对于微软 Windows 用户，请查看 <a href="https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">这篇文章</a>。 
    - 对于 Mac OS 用户，请查看 <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">这篇文章</a>。

3. 修改 **wordpress 配置**

    编辑 **/var/www/html/wp-config.php** 文件，修改
    - DB_HOST - RDS 实例的终端节点
    - DB_USER - 在 **数据库迁移** 步骤中配置的用户名
    - DB_PASSWORD - 在 **数据库迁移** 步骤中配置的密码
    
    再添加以下两行，用您的目标 Webserver EC2 的 **公有 DNS (IPv4)** 替换 **TARGET_WEBSERVER_PUBLIC_DNS**，以确保您的 WordPress 站点中的链接指向新的 Webserver。
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    例如
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

    {{% notice tip %}}
为了编辑这个文件，您可以使用 <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> 或者 <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>。
{{% /notice %}}     

4. 更新 RDS 实例的 **VPC 安全组**，允许来自 Webserver 的入站流量

    a. 转到  **AWS 控制台 > 服务 > EC2 > 安全组** 并选择您的 **RDS VPC 安全组** (DB-SG)  
    b. 进入 **入站** 页面，点击 **编辑** 按钮     
    c. 增加入站规则，允许来自 **Webserver**（使用它的 **安全组** 或者 **私有 IP**）在端口 **3306** (MySQL 端口)上的入站流量
    
    ![Inbound rules modification](/ce/database_update_security_group.zh.png)

    {{% notice tip %}}
如果您的 RDS 实例使用了不同的安全组名，您可以在 RDS 实例的 **连接和安全性** 部分的详细信息中找到。
{{% /notice %}}     
    

5. **验证** 迁移

    在浏览器中打开 Webserver 的公有 DNS (IPv4) 名称，您应该可以看到一个独角兽商店。

如果一切正常，请继续下一个环节，即 [优化]({{< ref "../optimization/_index.zh.md" >}})!

## 故障排查

1. 确保配置在 Webserver **/var/www/html/wp-config.php** 中的 RDS 数据库相关信息正确无误
2. 确保 RDS 数据库正在使用 **DB-SG** 安全组或者配置了正确的入站规则
3. 确保 Web 服务器的 CloudEndure 蓝图中 **subnet** 指向的是 **TargetVPC-public-subnet-b** 或者 **TargetVPC-public-subnet-a**
