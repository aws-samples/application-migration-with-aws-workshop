+++
title = "Configurando a Rede"
weight = 15
+++

Como não usamos uma **VPN** ou **AWS Direct Connect** neste workshop, **DMS Replication Instance** conectará ao banco de dados origem pela internet pública e ao banco de destino via rede privada.

![Architectura da Replication Instance](/db-mig/ri-network-conf.png)

### Crie um subnet group de replicação

Um dos pré-requisitos para usar o **AWS DMS** é ter configurado um **subnet group**, que é uma coleção de subnets usadas pelo **DMS Replication Instance**. 

1. Vá até **AWS Console > Services > Database Migration Service > Subnet groups** e clique em **Create subnet group**.
2. No **Create replication subnet group** entre com os seguintes parâmetros:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | select **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.png)

3. Clique no botão **Create subnet group**

### Configure o security group

O **VPC security group** neste workshop tráfego de entrada a partir do **DMS Replication Instance** para a RDS database de destino.

1. Crie um security group para o **DMS Replication Instance**

    a. Vá até **AWS Console > Services > EC2 > Security Groups** e clique no botão **Create Security Group**.

    b. Entre o **Security group name** (por exemplo: RI-SG), adicione uma **Description**, selecione a **TargetVPC** e pressione o botão **Create security group**.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  Não é necessário adicionar regras de entrada no security group **RI-SG** do **DMS Replication Instance** 
  {{% /notice %}}

2. Adicione uma Inbound rule no **DB-SG** security group

    a. Vá novamente para **AWS Console > Services > EC2 > Security Groups** e clique no **Security Group ID** do Security Group **DB-SG** criado anteriormente 
    
    b. Nos detalhes da tela do security group **DB-SG**, pressione o botão **Edit inbound rules**
      
    c. Na tela **Edit inbound rules** pressione o botão **Add rule** e configure a regra para permitir tráfego **inbound** a partir do security group do **DMS Replication Instance** na porta 3306 e pressione o botão **Save rules** 
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
