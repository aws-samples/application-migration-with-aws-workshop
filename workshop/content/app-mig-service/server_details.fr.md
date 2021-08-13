+++
title = "Configuration détaillée de la réplication"
weight = 40
+++

Dans la liste du menu <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Source Servers</a> cliquez sur le **Hostname** du serveur source.

Sur la page correspondant au serveur source, en sélectionnant les différents onglets, vous pouvez :

1. Voir la progression de la réplication

    Initialement, la barre de progression affichera 0%, mais cela augmentera au fur et à mesure que les données sont copiées de votre serveur source dans l'environnement AWS cible. Il faudra compter environ 30 minutes pour la réplication complète de ce serveur.

    ![Migration dashboard](/app_mig_serv/migration_dashboard.en.png)

2. Voir les informations relatives au serveur

    ![Server information](/app_mig_serv/server_info.en.png)

    Notamment le type d'instance AWS recommandé correspondant au serveur source

    ![Recommendation](/app_mig_serv/server_info_recommendation.en.png)

    Vous pouvez modifier le type d'instance à utiliser pour le serveur cible dans **Launch settings**.

3. Voir et modifier les étiquettes "tags"

    Ces tags sont utilisés pour la réplication et non pas pour étiqueter le serveur cible après la réplication.

    ![List tags](/app_mig_serv/manage_tags_1.en.png)

4. Voir et modifier les paramètres de disques intermédiaires

    Par défaut et par soucis d'économie, **AWS Application Migration Service** utilise des disques Standard HDD pour tout volume inférieur à 500 GiB. Il est possible de modifier ce choix.

    ![Disk settings](/app_mig_serv/disk_settings.en.png)

5. Voir et modifier les paramètres de réplication

    Il est possible de choisir des configurations spécifiques. Par exemple, un serveur peut subir beaucoup de modifications des données stockées sur ses disques. Dans ce cas là, il est intéressant de sélectioner un **Replication Server instance type** adapté avec plus de bande passante mais également de bénéficier d'un **dedicated Replication Server**.

    ![Change replication settings](/app_mig_serv/replication_settings.en.png)

6. Voir et modifier les paramètres de Launch

    Cette page permet de choisir les paramètres liés à l'instance EC2 cible. Nous pouvons désélectionner "automated right sizing" et définir des paramètres propres. 
    
7. Désélectionner rightsizing

    Nous pouvons désélectionner "automated rightsizing" et définir des paramètres propres. Cliquez sur le bouton **Edit** dans la partie **General launch settings**.

    ![Disable automated rightsizing](/app_mig_serv/launch_settings_general.en.png)

    Dans la page **Launch Settings**, modifiez **Instance type right sizing** en choisissant **None**, puis sauvegardez avec **Save settings**. Même si "rightsizing" est une bonne idée d'un point de vue économique, nous pouvons le faire manuellement dans **EC2 Launch Template**.

    ![Disable automated rightsizing](/app_mig_serv/launch_settings_general_disable_rightsizing.en.png)

8. Modifier **EC2 Launch Template**

    Appuyez sur le bouton **Modify** dans **EC2 Launch Template** puis confirmez que l'on veuille modifier ce document.

    ![Launch settings](/app_mig_serv/launch_settings_select.en.png)

    Vérifiez les différentes options disponibles sur la page **Modify template (Create new version)** à l'aide des liens **Info**. 

    Une fois fait, allez dans la section **Instance type** et choisissez **t3.micro** comme type d'instance.

    ![Launch template - modify network](/app_mig_serv/launch_template_select_instance.en.png)

    Puis, dans la section **Resource tags**, changez le libellé **Name** et tapez **Webserver**, comme dans la copie d'écran ci-dessous.

    ![Launch template - modify network](/app_mig_serv/launch_template_tags.en.png)

    Finalement, dans la section **Network interfaces**, pour la première **Network interface**, choisissez pour **Auto-assign public IP** la valeur **Enable** pour permettre d'avoir un accès public au serveur. Sélectionnez **TargetVPC-public-a** pour le **Subnet** qui contiendra le serveur cible après la migration. 

    ![Launch template - modify network](/app_mig_serv/launch_template_select_subnet.en.png)

    Enfin, sauvegardez ces changements en cliquant sur le bouton **Create template version**.

9.  Changer le **EC2 Launch Template** par défaut

    Cliquer sur le nom du **EC2 Launch Template**

    ![Click on EC2 Launch Template name](/app_mig_serv/launch_template_new_version.en.png)

    Dans la page **Launch Templates**, allez dans l'onglet **Versions**
    Sélectionnez la dernière version
    Dans le menu **Actions**, choisissez **Set default version**

    ![Set default version](/app_mig_serv/launch_template_update_version.en.png)

    Confirmez ce changement de version par défaut

    ![Confirm action](/app_mig_serv/launch_template_update_version_popup.en.png)

10. Retourner dans la <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">liste des serveurs sources</a>, puis choisir le **Hostname** correspondant au serveur source.

    En attendant que **Data replication status** devienne **Healthy** (cela devrait prendre environ 30 minutes), vous pouvez lire comment l'agent de réplication s'installe sous <a href="https://docs.aws.amazon.com/mgn/latest/ug/linux-agent.html" target="_blank" rel="noopener noreferrer">Linux</a> ou <a href="https://docs.aws.amazon.com/mgn/latest/ug/windows-agent.html" target="_blank" rel="noopener noreferrer">Windows</a>. La documentation explique également comment <a href="https://docs.aws.amazon.com/mgn/latest/ug/installing-agent-blocked.html" target="_blank" rel="noopener noreferrer">installer l'agent dans un réseau sécurisé</a> (en anglais).

    ![Data replication healthy](/app_mig_serv/data_replication_healthy.en.png)

    Une fois que **Data replication status** est **Healthy**, la prochaine étape sera de [lancer le serveur de test]({{< ref "/test.fr.md" >}}).
    