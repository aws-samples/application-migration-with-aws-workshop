+++
title = "Création d'un file system Amazon EFS"
weight = 20
+++

A partir de **AWS Console**, allez dans **Services** et sélectionnez **EFS**, cliquez alors sur **Create file system**.

![create-efs](/ecs/create-efs.png)

Sélectionnez le VPC que vous avez créé au début du workshop (ex : TargetVPC), les subnets privés par zone de disponibilité comme "mount targets" et EFS-SG comme "security group" pour chaque point de montage ("mount target"), cliquez alors sur **Next Step**.

dans **Step 2: Configurer les paramètres optimaux**, vous pouvez activer "lifecycle policy", changez le "throughput mode" et activer le cryptage. Pour cet exercice, activez le cryptage et laisser les valeurs par défaut pour les autres options.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Enfin, vérifiez vos paramètres et cliquez sur **Create File System**

Copier le **DNS name** du file system créé afin de l'utiliser ultérieurement dans l'étape **Create a Task Definition**.
![efs-details](/ecs/efs-details.png)

Maintenant, vous pouvez "monter" ce file system temporairement sur le serveur web pour copier le contenu source de wordpress.

### "Monter" le file system sur le serveur web

Cliquez sur le lien **Amazon EC2 mount instructions (from local VPC)** dans la description détaillée de Amazon EFS file system et suivez les instructions.

Installez le client nfs pour Ubuntu en utilisant cette commande :

```
sudo apt-get install nfs-common
```

Suivez les instructions suivantes pour monter le file system : 

![efs-mount](/ecs/efs-mount.png)

Lorsque que le file system est monté, copiez le contenu du répertoire **/var/www/html/wp-content** du serveur web vers le file system monté.

Exemple :
```
sudo cp -r /var/www/html/wp-content/* efs/
```
