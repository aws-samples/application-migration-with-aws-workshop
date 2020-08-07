+++
title = "创建 Amazon EFS 文件系统"
weight = 20
+++

在 **AWS 控制台** 中，转到 **服务** 并选择 **EFS**，然后单击 **创建文件系统**。

为文件系统起个名称（例如，webserver-filesystem），然后选择 TargetVPC, EFS 将会部署到其中。

![create-efs-name](/ecs/create-efs-name.zh.png)

点击 **创建** 按钮，然后单击列表中的 EFS文件系统 **webserver-filesystem**，以打开详细信息。

![create-efs](/ecs/create-efs-select.zh.png)

在 **Webserver-filesystem** 文件系统的详细信息中，转到 **网络** 选项卡，然后单击 **创建挂载目标** 按钮。

![create-efs](/ecs/create-efs-mount-target.zh.png)

在 Virtual Private Cloud (VPC) 下拉列表中选择 **TargetVPC**，添加两个挂载目标。

| 可用区                  | 子网 ID    	   | 安全组           |
| ---------------------- | -------------- | ---------------- |
| us-west-2a             | TargetVPC-private-a-web          | EFS-SG   |
| us-west-2b             | TargetVPC-private-b-web          | EFS-SG   |

![create-efs](/ecs/create-efs-configure-mount-target.zh.png)

点击 **保存** 按钮。

记下 **文件系统 ID**，稍后将需要它来挂载文件系统并定义所创建文件系统的 DNS 名称。DNS 名称遵循 **file-system-id**.efs.**aws-region**.amazonaws.com 的格式，因此在我的环境下为 **fs-3bc36a3e**.efs.**us-west-2**.amazonaws.com（请注意您的名称可能不同！）。

![create-efs](/ecs/create-efs-file-system-id.zh.png)

现在，您可以将文件系统临时挂载到 Webserver 实例中，以复制源 wordpress 内容。


### 将文件系统挂载到 Webserver

SSH 登录到 **Webserver** 中，运行以下命令：

```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

运行以下命令，将 **FILE_SYSTEM_ID** 替换为刚创建的 EFS 的 **文件系统 ID**。

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```

挂载文件系统后，使用以下命令将整个 **/var/www/html/wp-content** 文件夹从 Webserver 复制到挂载的文件系统。

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### 故障排查
如果在安装 EFS 时遇到任何挑战，请查看 https://docs.aws.amazon.com/zh_cn/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html 了解更多详细信息
