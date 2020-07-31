+++
title = "Crie um Amazon EFS file system"
weight = 20
+++

Na **AWS Console**, vá para **Services** e selecione **EFS**, então clique em **Create file system**.

![create-efs](/ecs/create-efs.png)

Selecione a VPC criada no começo do workshop (ex. TargetVPC), as private subnets para cada availability zone, os mount targets e o security group EFS-SG para cada mount target, então clique **Next Step**.

No **Step 2: Configure optional settings**, você pode habilitar uma lifecycle policy, mudar o modo de throughput e habilitar encryption. Para este exercício, habilite a encryption e deixe os valores  default para as outras opções.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Finalmente, revise suas configurações e clique **Create File System**

Copie o **DNS name** do file system criado para usar daqui a pouco, no passo **Create a Task Definition**.
![efs-details](/ecs/efs-details.png)

Agora você pode montar este file system temporariamente na instância do webserver para copiar o conteúdo do wordpress origem para ele.

### Montando o file system no webserver

Clique no link **Amazon EC2 mount instructions (from local VPC)** nos detalhes do Amazon EFS file system e siga as instruções.

Instale o nfs client na Ubuntu instance usando este comando:

```
sudo apt-get install nfs-common
```

Siga as instruções abaixo para montar o file system:

![efs-mount](/ecs/efs-mount.png)

Uma vez que tenha montado o filesystem, copie a pasta **/var/www/html/wp-content** do web server para o file system montado.

Exemplo:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
