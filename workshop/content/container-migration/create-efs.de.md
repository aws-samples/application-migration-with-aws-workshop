+++
title = "Erstellen Sie ein Elastic File System"
weight = 20
+++

Besuchen Sie die **AWS Console**, dann **Services** und wählen Sie **EFS** bitte, dann erstellen Sie 
den File-System mit **Create file system**.

![create-efs](/ecs/create-efs.png)

Als erstes Schritt, wählen Sie bitte die VPC aus, die Sie zu Beginn des Workshops erstellt haben (z. B. TargetVPC), 
private Subnetze je AD für die "Mount Targets" und die **EFS-SG** Sicherheitsgruppe für jeden "Mount Target" 
und dann klicken Sie auf **Nächster Schritt** darauf.

In zweiten Schritt **Configure optional settings** können Sie die Lebenszyklusrichtlinie (lifecycle policy) aktivieren, 
den Durchsatzmodus (throuput mode) ändern und die Verschlüsselung aktivieren. 
Aktivieren Sie für diese Übung die Verschlüsselung und wählen Sie die Standardwerte für die anderen Optionen aus.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Überprüfen Sie abschließend Ihre Einstellungen und klicken Sie auf **Create File System** darauf.

Kopieren Sie den **DNS-Namen** des erstellten Dateisystems, 
weil Sie ihn später benötigen werden (im Schritt **Erstellen einer Task-Definition**).

![efs-details](/ecs/efs-details.png)

Jetzt können Sie dieses Dateisystem vorübergehend in die Webserver-Instanz einbinden, 
um den Quell-WordPress-Inhalt darauf zu kopieren.

### Dateisystem auf Webserver mounten 

Klicken Sie in den Details des Amazon EFS-Dateisystems auf den Link **Amazon EC2 mount instructions**
(von der lokalen VPC) und befolgen Sie diese.

Installieren Sie den NFS-Client für die Ubuntu-Instanz. 
Verwenden Sie diesen Befehl:

```
sudo apt-get install nfs-common
```

Befolgen Sie die folgenden Anweisungen zum Mounten des Dateisystems:

![efs-mount](/ecs/efs-mount.png)

Kopieren Sie nach dem Mounten des Dateisystems den gesamten Ordner **/var/www/html/wp-content** 
vom Webserver in das gemountete Dateisystem um.

Beispiel:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
