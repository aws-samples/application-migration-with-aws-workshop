+++
title = "Creëer een Amazon EFS file systeem"
weight = 20
+++

In het **AWS Console**, ga naar **Services** en selecteer **EFS**, klik dan op **Create file system**.

Noem het file systeem (b.v. 'webserver-filesystem') en selecteer de **TargetVPC** waar het file systeem zal worden geplaatst.

![Create file system](/ecs/create-efs-name.en.png)

klik dan op **Create** om het file systeem te creëren. 

Klik dan op de **webserver-filesystem** naam voor het file systeem in de lijst om de details weer te geven.

![Select EFS from the list](/ecs/create-efs-select.en.png)

In de details van het **webserver-filesystem** file systeem, ga naar **Network** en druk op de **Create mount target** knop.

![Go to Network mount targets](/ecs/create-efs-mount-target.en.png)

Selecteer de **Target VPC** in de **Virtual Private Cloud (VPC)** drop-down en voeg twee **mount targets** toe.

| Availability zone    | Subnet ID      								   | Security groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.en.png)

Druk op de **Save** knop.

Noteer de **File system ID**, want dit heb je later nodig om het file systeem te koppelen en om de DNA naam van het file systeem te in te stellen. De DNS naam volgt dit formaat: **file-system-id**.efs.**aws-region**.amazonaws.com, zoals bijvoorbeeld: **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (dit zal voor jou verschillend zijn!).

![EFS file system id](/ecs/create-efs-file-system-id.en.png)

Nu kun je het file systeem tijdelijk aan de webserver koppelen om de Wordpress web bestanden te kopieëren.

### Mounting file system to webserver

Maak een SSH verbinding met je **Webserver** en geef de volgende commandos:
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Run vervolgens dit commando en vervang **FILE_SYSTEM_ID** met de juiste **File system ID** van het EFS File systeem dat je hebt aangemaakt.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Wanneer het file systeem is gekoppeld aan de web server, kopieëer dan de hele folderstructuur en inhoud van **/var/www/html/wp-content** naar het EFS file systeem.

Voorbeeld:
```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Troubleshooting

Indien je problemen hebt met het koppelen van het file systeem kijk dan naar dit document voor instructies: https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html
