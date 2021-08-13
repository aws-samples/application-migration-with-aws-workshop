+++
title = "Installation de l'agent"
weight = 30
+++

**AWS Application Migration Service** copie les données vers le cloud d'AWS à partir d'un agent installé sur le serveur source.

1. Obtenir les informations d'identification pour l'agent

    Pour que l'agent **AWS Application Migration Service** puisse copier les données, vous devez avoir un AWS IAM User avec les authorisations nécessaires dans le compte AWS cible (pour plus d'information, voir <a href="https://docs.aws.amazon.com/mgn/latest/ug/credentials.html" target="_blank" rel="noopener noreferrer">ici</a>). Un utilisateur a déjà été créé. Il suffit de copier l'identifiant Access Key ID et la clé Secret Access Key pour pouvoir les utiliser lors de l'installation de l'agent.

    Pour **Le lab effectué de manière indépendante** - les informations d'identification sont dans la section **Output** du "stack" **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>.

    ![AWS Credentials](/app_mig_serv/install_agent_credentials.en.png)    

    Pour **Le lab effectué dans le cadre d'un évènement AWS** - l'identifiant **AWS Application Migration Service - IAM Access Key ID** et la clé **IAM Secret Access Key** se trouvent sur le tableau de bord <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.    

    ![AWS Credetentials EE](/app_mig_serv/ee_credentials.en.png)

2. Obtenir les informations pour se connecter au serveur source

    Pour **Le lab effectué de manière indépendante** - les données relatives au serveur sont dans la section **Output** du "stack" **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Pour **Le lab effectué dans le cadre d'un évènement AWS** - l'adresse **Webserver IP**, l'utilisateur **Webserver Username** et la clé **Webserver SSH Key** se trouvent sur le tableau de bord <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

3. Téléchargez et sauvegardez localement (par example le fichier **webserver.pem**) la **clé SSH du serveur web** (.pem) 

    Si vous utilisez Microsoft Windows, merci de convertir le fichier clé SSH .pem en format .ppk en utilisant PuttyGen puis Putty pour se connecter. (plus de détails <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">peuvent être trouvés ici</a>.  

4. Connectez-vous au **Serveur web source** en utilisant le terminal SSH

    Pour les utilisateurs Microsoft Windows regardez <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">cet article</a>.  
    Pour les utilisateurs Mac OS regardez <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">cet article</a>.

5. Téléchargement et installation de l'agent

```shell
wget -O ./aws-replication-installer-init.py https://aws-application-migration-service-us-west-2.s3.amazonaws.com/latest/linux/aws-replication-installer-init.py
sudo python3 aws-replication-installer-init.py
```

6. Configuration de la région AWS et des informations d'identification

    A partir du prompt, lors de l'installation de l'agent, entrez la région **AWS Region** (us-west-2), puis les informations d'identification **AWS Access Key ID** et **AWS Secret Access Key** obtenus lors de l'étape 1.

    {{% notice note %}} Lors de la copie de la clé **AWS Secret Access Key**, le contenu n'est pas visible pour des raisons de sécurité. Tapez sur la touche **Enter**.
{{% /notice %}}   

7. Confirmation des volumes à copier

    Après avoir entré les informations d'identification, le programme d'installation vous propose un liste des volumes attachés au système. Tapez **Enter** pour sélectionner tous les volumes.

    ![Application Migration Service - agent installation](/app_mig_serv/install_agent.en.png)

8. Lancement de la réplication

    Une fois l'agent installé, le serveur source sera visible dans la liste <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Application Migration Service Source Servers</a>.

    ![Application Migration Service - Source Servers list](/app_mig_serv/source_servers.en.png)

    La réplication démarre immédiatement. Pendant que cette opération s'effectue, nous pouvons commencer l'étape suivante qui consiste à [configurer le serveur cible]({{< ref "/server_details.fr.md" >}}).

