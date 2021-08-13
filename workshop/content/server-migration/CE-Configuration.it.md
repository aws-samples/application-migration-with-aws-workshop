+++
title = "Configurazione di CloudEndure"
weight = 10
+++


Per iniziare, dovrai configurare CloudEndure con le **AWS credentials** per accedere al tuo Account AWS e la locazione (subnet) della **destinazione di replica** all'interno dell'account AWS di destinazione per il CloudEndure Replication Server.

### Configura le Credenziali AWS.

1. Accedi alla Console di Cloudendure all'indirizzo [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    Per il  **laboratorio self-paced** - utilizza il tuo Account di Migrazione CloudEndure Migration oppure creane uno nuovo [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) e un nuovo Progetto CloudEndure <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer"></a>

    Per **Eventi AWS** - utilizzare **CloudEndure Username** e **Password** elencati nell'  <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    Se non vengono mostrati nell' <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>, si prega di contattare il presentatore per fornire le credenziali.

2. Naviga nel tab **Setup & Info** > **AWS Credentials** .

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Clicca il bottone **EDIT** e inserisci **AWS Access Key ID** e **AWS Secret Access Key** 
   
    Per il  **laboratorio self-paced** - copia queste informazioni dalla sezione **Output**  del **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>, apparirà come nella schermata qui sotto.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Per l' **Evento AWS** - copia queste informazioni dal tuo <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> - sezione **CloudEndure AWS Credentials** , apparirà come nella schermata qui sotto.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)


4. Sovrascrivi tutti i valori già presenti nei campi  **AWS Access Key ID** e **AWS Secret Access Key**, fai clic sul pulsante **SAVE** .

### Configure Replication Settings.

Una volta salvate le **AWS Credentials**, verrai automaticamente reindirizzato alla scheda **Setup & Info** > **REPLICATION SETTINGS** , qui puoi configurare i dettagli del **CloudEndure Replication Server**.

{{% notice note %}}
Prima di procedere **aggiorna il browser** per recuperare le informazioni più recenti dal tuo account AWS (puoi farlo premendo il pulsante **F5** o aggiornando manualmente il browser facendo clic sul pulsante di aggiornamento).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Aggiorna la configurazione della schermata **REPLICATION SETTINGS** per abbinare i valori seguenti:

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

2. Scorri fino alla parte inferiore delle schermo e fai clic sul pulsante **SAVE REPLICATION SETTINGS**.

    {{% notice tip %}}
Se nella parte superiore dello schermo viene visualizzato un avviso in cui è necessario aggiornare le credenziali AWS, aggiornare il browser (F5).
{{% /notice %}}
