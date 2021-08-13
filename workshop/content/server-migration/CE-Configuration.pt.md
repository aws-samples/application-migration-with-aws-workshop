+++
title = "Configuração do CloudEndure"
weight = 10
+++


Para começar, você precisará configurar o CloudEndure com **credenciais AWS** para acessar sua conta AWS e **o destino da replicação** (subnet) dentro da conta AWS destino para o CloudEndure Replication Server.

### Configure as credenciais AWS.

1. Login na CloudEndure Console em [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    Para **quem está fazendo o lab sozinho** - use sua conta CloudEndure Migration e crie um novo [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) and a new <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">CloudEndure Project</a>

    Para **quem está num Evento AWS** - use o **CloudEndure Username** e **Password** listados no <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    Se eles não aparecem no <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>, contate o organizador para obter as credenciais.

2. Navegue para a aba **Setup & Info** > **AWS Credentials**.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Clique o botão **EDIT** e entre **AWS Access Key ID** e **AWS Secret Access Key** 
   
    Para **quem está fazendo o lab sozinho** - copie esta informação da seção **Output** do template **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>, será parecido com a imagem abaixo.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Para **Eventos AWS** - copie esta informação da seção <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> - **CloudEndure AWS Credentials**, como na imagem abaixo.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Sobrescreva quaisquer valores já existentes nos campos **AWS Access Key ID** e **AWS Secret Access Key**.

4. Uma vez que você entrou o **AWS Access Key ID** e **AWS Secret Access Key**, clique no botão **SAVE**.

### Configure o Replication Settings.

Uma vez que você salve as suas **AWS Credentials**, você será automaticamente redirecionado para a aba **Setup & Info** > **REPLICATION SETTINGS**, é aqui onde você configurará os detalhes do **CloudEndure Replication Server**.

{{% notice note %}}
Antes de seguir **atualize o browser** para recuperar a informação mais atualizada da conta AWS (você pode fazer isso apertando **F5** ou manualmente).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Atualize a tela **REPLICATION SETTINGS** com os valores abaixo:

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | Desmarcado                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | Desmarcado                                                |
    | Enable volume encryption                   | Marcado                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.png)

2. Vá até o fim da tela e clique no botão **SAVE REPLICATION SETTINGS**.

    {{% notice tip %}}
Caso veja uma mensagem no topo da tela dizendo que "AWS credentials must be refreshed", atualize o browser (F5).
{{% /notice %}}
