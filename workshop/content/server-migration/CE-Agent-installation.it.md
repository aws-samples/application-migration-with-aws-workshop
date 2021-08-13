+++
title = "Installazione Agente sulla Macchina Origine"
weight = 20
+++


Dalla <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure console</a>, naviga alla schermata  **Machines** che mostra **How to Add Machines** e fornisce istruzioni per installare l'agente sul computer di origine. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Installare Agente su un Webserver

1. Ottieni le Informazioni del Webserver di origine

    Per  **laboratorio self-paced** - è descritto nella sezione **Output** del  **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">Template CloudFormation</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Per l' **AWS Event** - è descritto nel **Webserver IP**, **Webserver Username** e **Webserver SSH Key** nella <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Scarica e salva localmente (per esempio come  **webserver.pem** ) la **Webserver SSH key** (.pem) 

    se stai usando un sistema operativo Microsoft Windows , per favore converti la chiave SSH key de un file .pem a .ppk usando PuttyGen e usando Putty per connetterti (ulteriori dettagli <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">possono essere trovati qui</a>.  

2. Connettersi al **Source Webserver** usando il terminale SSH

    Per gli utenti Microsoft Windows consulta <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">questo articolo</a>.  
    Per gli utenti Mac OS consulta <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">questo articolo</a>.

3. Esegui i comandi copiati da **How to Add Machines** per scaricare e installare l'agente:

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    Se eseguito correttamente, riceverai un messaggio che indica che  **l'installazione è stata completata correttamente**.
    
    {{% notice tip %}}
I comandi per l'installazione dell'agente possono essere ottenuti anche dalla console **CloudEndure**  **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Una volta installato l'agente, la macchina apparirà nel tab **CloudEndure console** -> **Machines** .

    ![CE-server-progress](/ce/CE-server-progress.png)

