+++
title = "Préparation de(s) Blueprint(s)"
weight = 30
+++

Pendant que les instances sont en cours de réplication, configurons un **CloudEndure Target Machine Blueprint**, qui correspond à la configuration de votre machine cible (instance répliquée) qui sera démarrée dans AWS. Le "Blueprint" inclut des paramètres comme le type d'instance (par exemple t3.medium), le **"subnet"** où la machine va fonctionner, son adresse **IP privée**  et le type de disques.

Pour configurer le "Blueprint", aller dans l'onglet **Machines** et cliquez sur le nom de la machine que vous souhaitez configurer. Puis naviguez jusqu'à la section **BLUEPRINT**.

![CE-BluePrints](/ce/CE-BluePrints.png)

Indiquez les informations suivantes :

| Parameter                                  | Value                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Add a 'Name' Tag with value 'Webserver' |


Tout le reste sera laissé avec les valeurs par défaut, mais revoyez la configuration afin de comprendre les options de configuration disponibles pour votre instance cible.

{{% notice warning %}}
Si vous déroulez ce workshop dans le cadre d'un évènemeznt AWS, vous ne devez pas sélectionner de type d'instance plus large que *.large, sinon vos privilèges IAM vous empêcheront d'opérer les instances créées plus tard dans le workshop.
{{% /notice %}}



{{% notice tip %}}
Si vous ne voyez pas les champs à saisir sur la page "BLUEPRINT" ou si il est difficle de paginer, réduiser la taille de votre écran (Control -).
{{% /notice %}}

Lorque c'est fait, Cliquez sur le bouton **SAVE BLUEPRINT** au bas de la page.
