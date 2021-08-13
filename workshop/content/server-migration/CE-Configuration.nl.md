+++
title = "Configureer CloudEndure"
weight = 10
+++


Voordat je kunt beginnen, dien je eerst de **AWS inloggegevens** in CloudEndure te configureren. Dit is nodig zodat CloudEndure toegang heeft tot de **replicatie-omgeving** (subnet) voor de CloudEndure Replicatieserver.

### Configureer AWS inloggegevens.

1. Ga naar de **CloudEndure Console** en log in [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    Voor het zelfstandig uitvoeren van deze workshop, gebruik je je eigen bestaande **CloudEndure Migration Account** of maak je een nieuw account aan via [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) en een nieuw <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">CloudEndure Project</a>

    Voor het uitvoeren tijdens een **AWS Event** - gebruik je de **CloudEndure Username** and **Password** die je kunt vinden in de <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    In het geval dat je daar geen inloggegevens kunt zien, zal de instructeur je deze kunnen verstrekken.

2. Ga naar het werkblad **Setup & Info** > **AWS Credentials**.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Druk op **EDIT** en voer de **AWS Access Key ID** en de **AWS Secret Access Key** in. 
   
    Voor het zelfstandig uitvoeren van deze workshop - kopieëer de informatie van de **Output** sectie van de **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>, zoals onderstaand voorbeeld.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Voor het uitvoeren tijdens een **AWS Event** - kopieëer de informatie van het <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> - **CloudEndure AWS Credentials** sectie, zoals onderstaand voorbeeld.

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Overschrijf eventuele reeds ingevulde waarden in de velden **AWS Access Key ID** en **AWS Secret Access Key**.

4. Zodra je de **AWS Access Key ID** en **AWS Secret Access Key** hebt ingevuld, druk dan op **SAVE**.

### Configureer Replicatie-instellingen.

Zodra je de **AWS Inloggegevens** hebt ingevuld, wordt je automatisch doorgestuurd naar het werkblad **Setup & Info** > **REPLICATION SETTINGS**. Hier ga je de details voor de configuratie van de **CloudEndure replicatie-server** invullen.

{{% notice note %}}
Voordat je verder gaat, **ververs je browser** om de laatste gegevens van je AWS account te verkrijgen (je kunt dit doen door op **F5** te drukken of door in je browser op **Refresh** te drukken).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Vul de configuratiegegevens voor de **REPLICATION SETTINGS** in volgens onderstaand schema:

    | Parameter                                  | Waarde                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | **(niet geselecteerd)**                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | **(niet geselecteerd)**                                                |
    | Enable volume encryption                   | **(geselecteerd)**                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.png)

2. Scroll naar beneden en druk op **SAVE REPLICATION SETTINGS**.

    {{% notice tip %}}
Indien je bovenaan het scherm een waarschuwing ziet dat je je AWS inloggegevens moet verversen, probeer dan eerst om de browser te verversen door op F5 of Refresh te drukken.
{{% /notice %}}
