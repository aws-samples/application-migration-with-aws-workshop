+++
title = "Crie uma Replication Instance"
weight = 20
+++

### Crie uma AWS DMS Replication Instance

Neste passo você criará uma <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migration Service</a> Replication Instance para iniciar a conexão entre os bancos de dados fonte e destino, transferir dados e fazer cache de qualquer mudanças que ocorram na base de dados fontes durante a carga inicial dos dados.


1. Na **AWS Console**, vá até **Services** e depois **Database Migration Service**.  

2. Clique em **Replication instances** e então no botão **Create replication instance**.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. Na tela **Create replication instance** configure uma nova replication instance com os seguintes parâmetros:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | Instance Class      | dms.t2.medium            |
    | Engine version      | 3.3.1                    |
    |Allocated storage (GB)| 50                      |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Como a imagem abaixo.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    Em **Advanced security and network configuration**, selecione o replication subnet group e o replication instance security group criados anteriormente.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Clique no botão **Create**.

    {{% notice note %}}
A criação da replication instance leva alguns minutos, espere até o **Status** mudar para **Available** antes de continuar com os próximos passos. Nesse meio tempo você pode ver os diferentes casos de uso do AWS DMS na página <a href="https://aws.amazon.com/dms/" target="_blank">AWS DMS Webpage</a>
{{% /notice %}}
