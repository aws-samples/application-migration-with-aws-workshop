+++
title = "Konfiguration von CloudEndure"
weight = 10
+++

Zu Beginn muss man CloudEndure mit **AWS Zugangsdaten** konfigurieren, 
um auf Ihr AWS-Konto und den **Replikationszielort (replication destination)** 
(Subnetz) innerhalb des AWS-Zielkontos für den CloudEndure-Replikationsserver zuzugreifen.

### Konfigurieren Sie AWS Zugangsdaten.

1. Melden Sie sich bei CloudEndure Console unter [https://console.cloudendure.com](https://console.cloudendure.com/) an.

    ![CE-login](/ce/CE-login.png)

    Für den Workshop **in einem eigenem AWS-Konto** - benutzen Sie Ihre dedizierte CloudEndure Migrationskonto 
    oder erstellen Sie bitte ein neues Konto bei [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) 
    und erstellen Sie einen neuen <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">CloudEndure-Projekt</a>   

    Bei Teilnahme an eine von **AWS gehostete Veranstaltung** - benutzen Sie **CloudEndure Username** und **Passwort** 
    vorhanden in der <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    Wenn die Zugangsdaten nicht in der <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">
    Event Engine - Team Dashboard</a> angezeigt werden, wenden Sie sich bitte an den Moderator, 
    um die Anmeldeinformationen zu bekommen.

2. Besuchen Sie **Setup & Info** > **AWS Credentials** Tab.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Klicken Sie bitte auf **EDIT** und geben Sie die **AWS Access Key ID** und **AWS Secret Access Key** ein. 
   
    Für den Workshop **in einem eigenem AWS-Konto** - Kopieren Sie diese Informationen aus dem **Output** 
    des **ApplicationMigrationWorkshop** CloudFormation Stack 
    <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west -2" target="_blank" rel="noopener noreferrer">
    CloudFormation-Template</a>, wie im folgenden Screenshot dargestellt. 

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Bei Teilnahme an eine von **AWS gehostete Veranstaltung** - benutzen Sie die Daten aus 
    <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> 
    - **CloudEndure AWS Credentials**, wie im folgenden Screenshot dargestellt.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Überschreiben Sie alle Werte, die bereits in den Feldern **AWS Access Key ID** 
    und **AWS Secret Access Key** vorhanden sind.

4. Nachdem Sie die **AWS Access Key ID** und **AWS Secret Access Key** eingegeben haben, 
    klicken Sie auf die Schaltfläche **SAVE** darauf. 

### Konfigurieren Sie die Replikationseinstellungen.

Sobald Sie Ihre **AWS Zugangsdaten** gespeichert haben, werden Sie automatisch zum Tab **Setup & Info** > **REPLICATION SETTINGS**  
weitergeleitet. Hier konfigurieren Sie bitte die Details zum **CloudEndure Replication Server**.

{{% notice note %}}
Before proceeding **refresh the browser** to retrieve the latest information from your AWS account (you can do this by pressing the **F5** button or manually refreshing your browser by clicking on the refresh button).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Aktualisieren Sie die Konfiguration von **REPLICATION SETTINGS**, den folgenden Werten zu entsprechen: 

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

2. Speichern Sie die Konfiguration mit **SAVE REPLICATION SETTINGS**.

{{% notice tip %}}
Wenn es ein Hinweis angezeigt wird, dass die AWS-Anmeldeinformationen aktualisiert werden müssen, 
aktualisieren Sie bitte den Browser (F5).
{{% /notice %}}
