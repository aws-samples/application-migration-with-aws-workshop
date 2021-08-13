+++
title = "Instale Agentes nas máquinas origem"
weight = 20
+++


A partir da <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure console</a>, navegue para a tela **Machines** que lhe mostra **How to Add Machines** e provê as instruções para instalar o agente na máquina orgiem. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Instale o Agente no Webserver

1. Pegue a informação do Webserver

    Para **quem estiver fazendo o lab sozinho** - está na seção **Output** do template **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Para **Evento AWS** - está nos campos **Webserver IP**, **Webserver Username** e **Webserver SSH Key** do <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Baixe e salve localmente (por examplo como **webserver.pem**) a chave **Webserver SSH key** (.pem) 

    Se você está usando Microsoft Windows, converta a chave SSH .pem para .ppk usando PuttyGen e então use o Putty para conectar (mais detalhes <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">podem ser encontrados aqui</a>.  

2. Conecte ao **Webserver origem** usando o terminal SSH

    Para usuários Microsoft Windows veja <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">este artigo</a>.  
    Para usuários Mac OS veja <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">este artigo</a>.

3. Rode os comandos copiados do **How to Add Machines** para baixar e instalar o agente:

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    Estando tudo certo, você receberá uma messagem dizendo **Installation finished successfully**.
    
    {{% notice tip %}}
Comandos para instalar o agente também podem ser encontrados na console **CloudEndure** em **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Uma vez que o agente estiver instalado, a máquina irá aparecer na aba **CloudEndure console** -> **Machines**.

    ![CE-server-progress](/ce/CE-server-progress.png)