+++
title = "Configuration de l'application"
weight = 80

+++

### Configurer le serveur web pour accéder à la base de données

Lorsque le Cutover est terminé et que **Application Migration Service** a créé une instance fonctionnelle du serveur web dans votre compte AWS, c'est le moment de mettre à jour la configuration du serveur web pour utiliser votre base de données RDS répliquée (créée dans l'étape **Migration de la base de données**).


1. Mettez à jour le **security group du serveur web**

    a. Allez dans **AWS Console -> EC2** et sélectionnez le serveur web dans la liste
    b. Allez dans l'onglet **Networking** et notez l'adresse **Public DNS (IPv4)** et **Private IP**  
    
    ![Webserver details](/app_mig_serv/configure_app_webserver_ip.en.png)

    c. Allez dans l'onglet **Security** puis cliquez sur le "Security Group" qui a été assigné

    d. Modifiez les règles "inbound" pour ce "Security Group" pour autoriser le traffic de n'importe quelle source sur le port **80** et de votre portable pour le port **22**

    ![Inbound rules modification](/app_mig_serv/edit_webserver_inbound_rules.en.png)

2. Connectez-vous sur le **serveur web** créé par **AWS Application Migration Service**  

    Utilisez le même compte (ubuntu) et la clé SSH .ppk de l'environnement source.

    Si vous ne savez pas comment accéder aux serveurs avec une clé SSH, regardez :
    - Pour les utilisateurs Microsoft Windows regardez <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">cet article</a>.  
    - Pour les utilisateurs Mac OS users regardez <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">cet article</a>.

3. Modifiez la **configuration wordpress**

    Editez le fichier **/var/www/html/wp-config.php**, modifiez
    - DB_HOST - Endpoint de la base de donnée RDS créée o
    - DB_USER - L'utilisateur configuré dans l'étape  **Migration de base de données**
    - DB_PASSWORD - Le mot de passe configuré dans l'étape  **Migration de base de données**
    
    Ajoutez aussi les deux lignes suivantes, remplacez **TARGET_WEBSERVER_PUBLIC_DNS** avec **Public DNS (IPv4)** de votre serveur web cible, afin de vous assurer que les liens dans votre site wordpress pointent vers le serveur web. 
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    for example
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

    {{% notice tip %}}
Pour éditer ce fichier, vous pouvez par exemple utiliser <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> ou <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Mettez à jour le **VPC security group** de l'instance RDS pour autoriser le traffic "inbound" venant du serveur web

    a. Aller dans **AWS Console > Services > EC2 > Security Groups** et sélectionnez votre **RDS VPC security group** (DB-SG)  
    b. Aller dans l'onglet **Inbound** et cliquez sur le bouton **Edit**  
    c. Ajoutez les règles "inbound" qui autorisent le traffic venant du **serveur web** (en utilisant ses adresses **Private IP** ou le **security group** auquel il appartient) sur le port **3306** (port MySQL)
    
    ![Inbound rules modification](/app_mig_serv/database_update_security_group.en.png)

    {{% notice tip %}}
Si vous utilisez un nom de  "Security Group" différent pour votre instance RDS, vous pouvez trouver les informations détaillées dans la section **Security**, **Connectivity & security**.
{{% /notice %}}

5. **Valider** la migration

    Tapez le nom Public DNS (IPv4) de votre serveur web dans le browser, vous devriez voir l'application  unicorn store.

Si tout s'est bien déroulé, procédez à la phase suivante, soit [Migrer vers les Containers]({{< ref "../container-migration/_index.fr.md" >}})!

## En cas d'erreurs

1. Assurez-vous que la configuration de votre base de données RDS sur le serveur web est correcte dans le fichier **/var/www/html/wp-config.php**
2. Assurez-vous que votre base de données RDS utilise le "Security Group" **DB-SG**
3. Assurez-vous que le Webserver EC2 Launch Template pointe vers **TargetVPC public-subnet-a**
