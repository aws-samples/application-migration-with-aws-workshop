+++
title = "Préparation"
weight = 20
+++

L'utilisation d'**AWS Application Migration Service** nécessite la création d'un document pour configurer la réplication. Ce document, appelé "template", définie la configuration du serveur qui aura la responsabilité de recevoir les données envoyées par l'agent et de les stocker sur des volumes EBS.

1. Allez dans la <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2" target="_blank" rel="noopener noreferrer">console AWS Application Migration Service</a>
2. Cliquez sur le bouton **Get started**
3. Entrez les données suivantes dans le formulaire **Set up Application Migration Service**

    | Paramètre                                  | Valeur                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Staging area subnet                    | TargetVPC-public-a        |
    
    Il s'agit du VPC "subnet" dans lequel AWS Application Migration Service va créer un serveur en charge de la réplication.

    Vous pouvez utiliser les valeurs par défaut pour les autres paramètres. Vous pouvez cliquer sur chaque icône **Info** pour mieux comprendre leur role.

    ![Initial setup](/app_mig_serv/setup.en.png)

4. Cliquez sur le bouton **Create template**

{{% notice note %}}
Vous pouvez toujours visiter **Replication Settings template** dans une région AWS donnée à partir du menu <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/settings" target="_blank" rel="noopener noreferrer">Settings</a>.
{{% /notice %}}   

Nous pouvons dorénavant passer à l'étape suivante, [l'installation de l'agent]({{< ref "/install_agent.fr.md" >}}) sur le serveur source.