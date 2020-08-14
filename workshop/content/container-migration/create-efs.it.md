+++
title = "Creare un Amazon EFS file system"
weight = 20
+++

Dalla **AWS Console**, andare su **Services** e selezionare **EFS**, quindi cliccare su **Create file system**.

Assegnare un nome al file system (ad es. "Server Web-file system") e selezionare il TargetVPC, in cui verrà distribuito EFS.

![Create file system](/ecs/create-efs-name.en.png)

Cliccare sul pulsante **Create** , e quindi selezionare il nome  **webserver-filesystem** dell'EFS nella lista, per aprire i dettagli.

![Select EFS from the list](/ecs/create-efs-select.en.png)

Nei dettagli del **webserver-filesystem** file system, andare sul tab **Network** e selezionare il pulsante **Create mount target**.

![Go to Network mount targets](/ecs/create-efs-mount-target.en.png)

Selezionare il  **Target VPC** nel menu a tendina Virtual Private Cloud (VPC) e aggiungere 2 mount target.

| Availability zone    | Subnet ID      								   | Security groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.en.png)

Selezionare il pulsante **Save**.

Prendere nota del  **File system ID**, ne avrete bisogno in seguito per montare il file system e per definire il nome DNS del file system creato. Il nome DNS segue il formato  **file-system-id**.efs.**aws-region**.amazonaws.com, quindi nel mio caso è **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (nota che sarà diverso per te!).

![EFS file system id](/ecs/create-efs-file-system-id.en.png)

Ora puoi montare temporaneamente il file system nell'istanza del server Web per copiare il contenuto wordpress di origine.

### Montaggio del file system sul server web

SSH nel tuo **Webserver** e esegui i seguenti comandi:
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Esegui il seguente comando, sostituendo  **FILE_SYSTEM_ID** con **File system ID** dell' Elastic File System appena creato.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Una volta montato il filesystem, copia l'intera cartella **/var/www/html/wp-content** dal server web al file system montato con il seguente comando.

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Risoluzione dei problemi

In caso di problemi con il montaggio di EFS, controllare https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html per maggiori dettagli