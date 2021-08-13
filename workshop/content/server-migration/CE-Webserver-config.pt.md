+++
title = "Configure a Aplicação"
weight = 50

+++

### Configure o Webserver para acessar o banco de dados de destino

Quando o Cutover (virada) for finalizado e o **CloudEndure Migration** tenha criado uma instância Webserver na sua conta AWS, é hora de atualizar a configuração da aplicação web para usar o banco de dadosAWS RDS (criado no passo **Migração do Banco de Dados**).


1. Atualie o **Webserver security group**

    a. Vá até **AWS Console -> EC2** e selecione o Webserver na lista  
    b. Anote o endereço **Public DNS (IPv4)** e o **Private IP**  
    c. Clique no security group assinalado para o Webserver  

    ![Webserver details](/ce/webserver_details.png)

    d. Modifique as inbound rules para que o security group permita tráfego de qualquer lugar na porta **80** e a partir do seu laptop na porta **22**     

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Login no **Webserver** criado pelo CloudEndure  

    Use o mesmo username (ubuntu) e a chave SSH .ppk do ambiente origem.

    Caso não saiba como usar o SSH para acessar os servidores, cheque o seguinte:
    - Para usuários Microsoft Windows veja <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">este artigo</a>.  
    - Para usuários Mac OS veja <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">este artigo</a>.

3. Modifique a **configuração do Wordpress**

    Edite o arquivo **/var/www/html/wp-config.php**, modificando
    - DB_HOST - Endpoint do RDS instance
    - DB_USER - o username configurado no passo **Migração do Bacno de Dados**
    - DB_PASSWORD - a password configurada no passo **Migração do Bacno de Dados**
    
    Adicione também as seguintes linhas, substituindo **TARGET_WEBSERVER_PUBLIC_DNS** com o endereço  **Public DNS (IPv4)** do Webserver EC2 de forma a garantir que os links do seu wordpress apontem para o novo webserver.
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    Por exemplo:
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

    {{% notice tip %}}
Para editar este arquivo, você pode usar por exemplo <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> ou <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Atualize o **VPC security group** da RDS instance para permitir tráfego de entrada a partir do Webserver

    a. Vá até  **AWS Console > Services > EC2 > Security Groups** e selecione o **RDS VPC security group** (DB-SG)  
    b. Na aba **Inbound** clique no botão **Edit**   
    c. Adicione uma inbound rule que permita tráfego a partir do **Webserver** (usando seu **Private IP** ou o **security group** ao qual ele pertence) na porta **3306** (porta do MySQL)
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

    {{% notice tip %}}
Caso tenha usado um nome de security group diferente para sua RDS instance, você pode encontrá-lo nos detalhes da sua RDS instance, na seção **Connectivity & security**, **Security**.
{{% /notice %}}     
    

1. **Valide** a migração

    Abra o Public DNS (IPv4) do Webserver no seu web browser, você deverá ver uma loja de unicórnios.

Estando tudo certo, vá para a próxima fase que é [Otimização]({{< ref "../optimization/_index.pt.md" >}})!

## Resolução de problemas

1. Verifique se a informação do RDS database configurada no Webserver em **/var/www/html/wp-config.php** está correta
2. Verifique se o RDS database está usando o security group **DB-SG** 
3. Verifique se o CloudEndure Blueprint do Webserver aponta para o **TargetVPC public-subnet-a**
