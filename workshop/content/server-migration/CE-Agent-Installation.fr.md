+++
title = "Installation de l'agent sur les machines source"
weight = 20
+++


A partir de la <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure console</a>, naviguez vers l'écran **Machines** qui vous indique **Comment ajouter des machines** et fournit les instructions pour installer l'agent sur la machine source.

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Installation de l'agent sur le serveur web

1. Récupérez les informations concernant le serveur web

    Pour **Le lab effectué de manière indépendante** - c'est décrit dans la section **Output** du "template" **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Pour **Le lab effectué dans le cadre d'un évènement AWS** - c'est décrit dans **Webserver IP**, **Webserver Username** et **Webserver SSH Key** sur le tableau de bord <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Téléchargez et sauvegardez localement (par example le fichier **webserver.pem**) la **clé SSH du serveur web** (.pem) 

    Si vous utilisez Microsoft Windows, merci de convertir le fichier clé SSH .pem en format .ppk en utilisant PuttyGen puis Putty pour se connecter. (plus de détails <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">peuvent être trouvés ici</a>.  

2. Connectez-vous au **Serveur web source** en utilisant le terminal SSH

    Pour les utilisateurs Microsoft Windows regardez <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">cet article</a>.  
    Pour les utilisateurs Mac OS regardez <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">cet article</a>.

3. Exécutez la commande copiée à partir de **How to Add Machines** pour télécharger et installer l'agent :

    ![Exemple de résultat de l'installation de l'agent](/ce/CE-Agent-install-detailed.png)

    Si l'installation est réalisée correctement, vous recevrez un message indiquant **Installation finished successfully**.
    
    {{% notice tip %}}
Les commandes pour installer l'agent peuvent aussi être obtenues à partie de la console **CloudEndure** dans **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Dès que l'agent est installé, la machine devient visible dans l'onglet **CloudEndure console** -> **Machines**.

    ![CE-server-progress](/ce/CE-server-progress.png)

