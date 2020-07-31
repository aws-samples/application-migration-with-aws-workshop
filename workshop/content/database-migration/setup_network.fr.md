+++
title = "Configuration du réseau"
weight = 15
+++

Comme nous n'utilison pas de **VPN** ou de **AWS Direct Connect** dans ce workshop, **DMS Replication Instance** devra se connecter à la base de données source via l'internet public et via le réseau privé pour la base de données cible.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Configuration du "security group"

Dans ce workshop le **"security group" du VPC** doit autoriser le traffic entrant à partie de **l'instance de réplication DMS** vers la base de données RDS cible.

1. Créer un "security group" pour **l'instance de réplication DMS**

    a. Aller dans **AWS Console > Services > EC2 > Security Groups** et cliquez sur le bouton **Create Security Group**.

    b. Entrez **un nom de "Security group"** (par exemple RI-SG), donner lui une **Description**, sélectionnez le **TargetVPC** pour le champ VPC et pressez sur le bouton **Create security group**.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  Il n'y a pas besoin d'ajouter des règles de "inbound" à **L'instance de réplication DMS** "security group" **RI-SG**
  {{% /notice %}}

2. Ajoutez des règles "Inbound" au "security group" **DB-SG**

    a. Aller sur la page **AWS Console > Services > EC2 > Security Groups** cliquez sur **Security Group ID** du "Security Group" de la base de données **DB-SG** créé précédemment
    
    b. Sur l'écran détaillé du "Security Group" **DB-SG**, pressez sur le bouton **Edit inbound rules**
      
    c. Dans l'écran **Edit inbound rules** pressez le bouton **Add rule** et configurez la règle pour autoriser le traffic **inbound** à partir du "Security Group" de **L'instance de réplication DMS** sur le port 3306 et pressez le bouton **Save rules**
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
