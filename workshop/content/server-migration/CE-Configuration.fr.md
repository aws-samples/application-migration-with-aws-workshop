+++
title = "Configuration CloudEndure"
weight = 10
+++


Pour commerncer, vous allez avoir besoin de configurer CloudEndure avec vos **AWS credentials** pour accèder votre compte AWS et la localisation de la **Destination de réplication** (subnet) dans le compte AWS cible pour le serveur de réplication CloudEndure.

### Configurer les AWS Credentials.

1. Connectez-vous sur la console CloudEndure à l'adresse [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    Pour **Le lab effectué de manière autonome** - utilisez votre compte existant CloudEndure Migration Account ou créez en un [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) ainsi qu'un nouveau <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">Projet CloudEndure</a>

    Pour **Le lab effectué dans le cadre d'un évènement AWS** - utilisez **CloudEndure Username** et **Password** listés dans <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">le tableau de bord Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    Si ils ne sont pas indiqués dans le tableau de bord <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>, merci de contacter l'animateur pour vous fournir les accès.

2. Naviguez jusqu'à l'onglet **Setup & Info** > **AWS Credentials**.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Cliquez sur le bouton **EDIT** et entrez **AWS Access Key ID** et **AWS Secret Access Key** 
   
    Pour **Le lab effectué de manière autonome** - copiez cette information à parir de la section **Output** du "template" **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation </a>, Ceci devrait ressembler à la copie d'écran ci-dessous.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Pour **Le lab effectué dans le cadre d'un évènement AWS** - copiez cette information à partir de la section <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> - **CloudEndure AWS Credentials**, Ceci devrait ressembler à la copie d'écran ci-dessous.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Ecrasez toutes les valeurs qui seraient déjà présentes dans les champs **AWS Access Key ID** et **AWS Secret Access Key**.

4. Dès que vous avez entré les valeurs **AWS Access Key ID** et **AWS Secret Access Key**, cliquez sur le bouton **SAVE**.

### Configuration des paramètres de réplication.

Dès que vous avez sauvegardé vos **AWS Credentials**, vous serez autoamtiquement redirigé vers l'onglet **Setup & Info** > **REPLICATION SETTINGS**, c'est ici que vous allez configurer les paramètres du **Serveur de Réplication CloudEndure**.

{{% notice note %}}
Avant de commencer, **Rafraîchir le browser** pour retrouver les dernières informations de votre compte AWS (vous pouvez faire cela en pressant la touche **F5** ou manuellement rafraîchir le browser en cliquant sur le bouton de rafraîchissement.
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Mettez à jour la configuration dans l'écran **REPLICATION SETTINGS**  avec les valeurs indiquées ci-dessous :

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | Unchecked                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | Unchecked                                                |
    | Enable volume encryption                   | Checked                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.png)

2. Paginez jusqu'au bas de la page et cliquez sur le bouton **SAVE REPLICATION SETTINGS**.

    {{% notice tip %}}
Si en haut de la page vous voyez une notice indiquant que les "credentials AWS" doivent être rafraîchies, merci de rafraîchir le browser (F5).
{{% /notice %}}
