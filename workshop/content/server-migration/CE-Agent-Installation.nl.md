+++
title = "Installeer de SW-Agent in de bronomgeving"
weight = 20
+++

Vanuit de <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure console</a>, ga naar **Machines**. Hier zie je hoe je servers kunt toevoegen en geeft je instructies hoe je de SW-Agent kunt installeren op de servers in de bronomgeving. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Installeer de SW-Agent op de Webserver

1. Ga naar de webserver information voor de bronomgeving

    Voor het zelfstandig uitvoeren van deze workshop - Het staat beschreven in de **Output** sectie van het **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Voor het uitvoeren tijdens een **AWS Event** - Het staat beschreven in **Webserver IP**, **Webserver Username** en **Webserver SSH Key** op het <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Download de **Webserver SSH key** (.pem) en sla deze lokaal op op je computer (bijvoorbeeld als **webserver.pem**)  

    Indien je computer op Microsoft Windows draait, dan dien je de **SSH key** .pem file te converteren naar .ppk via PuttyGen en dan Putty te gebruiken voor het inloggen via SSH (voor meer informatie zie <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">hier</a>).  

2. Log in op de **Webserver in de bronomgeving** via SSH

    Voor **Microsoft Windows** gebruikers, zie: <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">dit artikel</a>.  
    Voor **Mac OS** gebruikers zie: <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">dit artikel</a>.

3. Run de commandos voor het downloaden en installeren van de SW-Agent, die je had gekopieëerd toen je de **Machines** aan CloudEndure toevoegde.

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    Je krijgt hierna een melding dat the installatie succesvol verlopen is (**Installation finished successfully**).
    
    {{% notice tip %}}
De commandos voor het installeren van de SW-agent kun je ook vinden via de **CloudEndure** console onder **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Nadat de SW-Agent is geïnstalleerd op de server, kun je de server zien in de **CloudEndure console** onder het **Machines** werkblad.

    ![CE-server-progress](/ce/CE-server-progress.png)

