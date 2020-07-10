+++
title = "Crea un file system Amazon EFS"
weight = 20
+++

Dalla **AWS Console**, vai su **Services** e seleziona **EFS**, quindi clicca **Create file system**.

![create-efs](/ecs/create-efs.png)

Seleziona il VPC che hai creato all'inizio del workshop (ad esempio TargetVPC), le sottoreti private per zona di disponibilità per le destinazioni di montaggio e il gruppo di sicurezza EFS-SG per ciascuna destinazione di montaggio, quindi fai clic su **Next Step**.

Nello **Step 2: Configure optional settings**, è possibile abilitare policy di lifecycle, modificare la modalità di throughput e abilitare la crittografia. Per questo esercizio, abilita la crittografia e lascia i valori predefiniti per le altre opzioni.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Infine, rivedi le tue impostazioni e fai clic **Create File System**

Copia il  **nome DNS** del file system creato come sarà necessario in seguito, nello step **Create a Task Definition**.
![efs-details](/ecs/efs-details.png)

Ora è possibile montare temporaneamente questo file system nell'istanza del server web per copiare il contenuto wordpress di origine su di esso.

### Montare il file system al webserver

Clicca sulle **istruzioni di mount di Amazon EC2 (da VPC locale)** nei dettagli del file system Amazon EFS e seguile.

Installa il client nfs per l'istanza Ubuntu , usando questo commando:

```
sudo apt-get install nfs-common
```

Seguire le istruzioni seguenti per montare il file system:

![efs-mount](/ecs/efs-mount.png)

Una volta montato il filesystem, copia l'intera cartella **/var/www/html/wp-content** dal server web al file system montato.

Esempio:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
