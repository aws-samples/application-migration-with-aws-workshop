+++
title = "Crie um Amazon EFS file system"
weight = 20
+++

Na **AWS Console**, vá para **Services** e selecione **EFS**, então clique em **Create file system**.

Nomeie o file system (ex. 'webserver-filesystem') e selecione a TargetVPC onde o EFS será criado.

![Create file system](/ecs/create-efs-name.en.png)

Clique no botão **Create**, depois clique no nome do EFS  **webserver-filesystem** da lista, para abrir os detalhes.

![Select EFS from the list](/ecs/create-efs-select.en.png)

Nos detalhes do **webserver-filesystem** file system, vá para a aba **Network** e clique no botão **Create mount target**.

![Go to Network mount targets](/ecs/create-efs-mount-target.en.png)

Selecione a **Target VPC** na lista de Virtual Private Cloud (VPC) e adicione 2 mount targets.

| Availability Zone    | Subnet ID      								   | Security Groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.en.png)

Clique em **Save**.

Anote o **File system ID**, você precisará dele mais tarde para montar o file system e definir o nome DNS name do file system criado. O nome DNS segue o formato **file-system-id**.efs.**aws-region**.amazonaws.com, então no meu caso é **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (mas ele pode ser diferente no seu caso!).

![EFS file system id](/ecs/create-efs-file-system-id.en.png)

Agora, você pode montar o file system temporariamente no Webserver instance para copiar o conteúdo fonte do wordpress.

### Montando o file system no webserver

SSH no seu **Webserver** e rode os seguintes comandos:
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Rode o seguinte comando, substituindo o **FILE_SYSTEM_ID** com o **File system ID** do Elastic File System yque você acabou de criar.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Uma vez que o filesystem esteja montado, copie a pasta **/var/www/html/wp-content** do web server para o file system montado com o seguinte comando.

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Em caso de problemas

Caso não consiga montar o EFS, verifique https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html para mais detalhes