+++
title = "Création d'un système de fichiers Amazon EFS"
weight = 20
+++

A partir de **AWS Console**, allez dans **Services** et sélectionnez **EFS**, cliquez alors sur **Create file system**.

Nommez le "file system" (ex 'webserver-filesystem') et sélectionnez le "TargetVPC", où le système de fichiers EFS sera déployé. 

![Créer le système de fichiers](/ecs/create-efs-name.en.png)

Cliquez sur le bouton **Create**, puis cliquez sur le nom **webserver-filesystem** du système de fichiers EFS dans la liste pour ouvrir le détail.

![Sélectionnez EFS à partir de la liste](/ecs/create-efs-select.en.png)

Dans le détail du système de fichiers **webserver-filesystem**, aller dans l'onglet **Network** et cliquez sur le bouton **Create mount target**.

![Aleer à Network mount targets](/ecs/create-efs-mount-target.en.png)

Sélectionnez **Target VPC** dans la liste déroulante Virtual Private Cloud (VPC) et ajoutez deux "mount targets".

| Availability zone    | Subnet ID      								   | Security groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configurez les Network "mount targets"](/ecs/create-efs-configure-mount-targets.en.png)

Cliquez sur le bouton **Save**.

Notez le **File system ID**, vous en aurez besoin ensuite pour monter le système de fichiers et pour définir son nom DNS. Le nom DNS a le format **file-system-id**.efs.**aws-region**.amazonaws.com. Dans mon cas c'est **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (notez que ce sera différent pour vous !).

![Id du système de fichiers EFS](/ecs/create-efs-file-system-id.en.png)

Maintenant, vous pouvez monter le système de fichiers temporairement sur le serveur web afin de copier le contenu wordpress source.

### Monter le système de fichiers sur le serveur web

SSH vers le **Serveur web** et exécutez les commandes suivantes :
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Exécutez les commandes suivantes en remplaceant le **FILE_SYSTEM_ID** avec le **File system ID** du système de fichier Elastic File System que vous venez de créer.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Dès que le système de fichiers est monté, copier tout le répertoire **/var/www/html/wp-content** du serveur web vers celui-ci en exécutant la commande suivante :

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Dépannage

Si vous rencontrez des problèmes pour monter le système de fichiers EFS, merci de consulter https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html pour plus d'informations.