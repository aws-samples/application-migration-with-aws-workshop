+++
title = "Creëer een Amazon EFS file systeem"
weight = 20
+++

In het **AWS Console**, ga naar **Services** en selecteer **EFS**, klik dan op **Create file system**.

![create-efs](/ecs/create-efs.png)

Select the VPC that you have created at the beginning of the workshop (e.g TargetVPC), en klik op de **Customize** knop. Scroll omlaag in de **File system settings** sectie en klik op de **Next** knop. Onder **Mount targets** selecteer je **private subnet** voor iedere **Availability Zone** en **EFS-SG** security groep, klik dan op de **Next** knop.

In de **File system policy - optional** sectie, klik op **Next**. 

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Controleer je configuratie en klik dan op **Create** om het file systeem te creëren.

Kopieëer de **DNS name** van het file systeem, want dit heb je later nodig in de **Create a Task Definition** stap.
![efs-details](/ecs/efs-details.png)

Nu kun je het file systeem tijdelijk aan de webserver koppelen om de Wordpress web inhoud er naartoe te kopieëren.

### Koppel het file systeem aan de webserver

Klik op de **Amazon EC2 mount instructions (from local VPC)** link onder de **Amazon EFS file system details** en volg de instructies.

Je kunt de stap om de NFS client te installeren overslaan, want deze is reeds geïnstalleerd op de **EC2 Instance**.

![efs-mount](/ecs/efs-mount.png)

Wanneer het file systeem is gekoppeld aan de web server, kopieëer dan de hele folderstructuur en inhoud van **/var/www/html/wp-content** naar het EFS file systeem.

Voorbeeld:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
