+++
title = "Zelfstanding uitvoeren van de workshop"
weight = 20
+++

{{% notice warning %}}
Voltooi deze sectie alleen als je de workshop zelf doorloopt. Als je bij een AWS georganiseerd evenement bent (zoals Re:Invent, Gameday, Workshop of een ander evenement dat wordt georganiseerd door een AWS-medewerker), ga je naar [Uitvoeren van de workshop tijdens een AWS Event]({{< ref "./migration-hub.nl.md" >}}).
{{% /notice %}}

### Leeromgeving in eigen tempo

Dit lab gaat ervan uit dat je toegang hebt tot een **AWS Account** met <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">Administrator rechten</a>. Om een nieuw AWS account aan te maken, volg de instructies in dit artikel <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">How do I create and activate a new Amazon Web Services account?</a>

De onderstaande instructies zullen de bronomgeving implementeren in je AWS-account, de geïmplementeerde bronomgeving bestaat uit twee **t3.micro** EC2 machines (één voor webserver, één voor database), een **NAT Gateway**, een **API Gateway** en twee **AWS Lambda functies** (voor het eenvoudig ophalen van **EC2 Access Keys**). 

De totale kosten van middelen die in het hele lab worden ingezet, zijn minder dan $5 (gebasseerd op 4 uur werk), sommige kosten worden gedekt door <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">AWS Free tier</a>. Vergeet niet om uw AWS-account [op te ruimen]({{< ref "/cleanup/_index.nl.md" >}}) na het uitvoeren van de workshop, om onnoodzakelijke kosten te voorkomen!

#### Optie 1: Eenvoudige implementatie

1. Druk op de onderstaande knop: <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>

2. In **Step 1 - Specify template** bevestig dat de URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml is ingevuld in het veld **Amazon S3 URL** en druk op **Next**
  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

3. In **Step 2 - Specify stack details** bevestig dat **ApplicationMigrationWorkshop** is ingevuld in het veld **Stack name** en druk op **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

4. In **Step 3 - Configure stack options** wijzig niets, druk op **Next**  

5. In **Step 4 - Review** scroll omlaag en selecteer alle opties volgens onderstaand voorbeeld en druk daarna op **Next** om de implementatie te beginnen.  
  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

Wanneer de implementatie in status **CREATE_COMPLETE** is, kun je informatie over de geïmplementeerde bronomgeving vinden in de **AWS Console -> CloudFormation** door **ApplicationMigrationWorkshop** te selecteren en het **Outputs** blad te selecteren. Je ziet soortgelijke informatie als in onderstaande illustratie.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Kopieëer en plak deze informatie, want deze heb je nodig tijdens de workshop.

Nu kun je verder gaan met het opzetten van [AWS Migration Hub]({{< ref "/migration-hub.nl.md" >}})

#### Optie 2: Alles zelf installeren via de broncode

{{% notice note %}}
Je hoeft **Optie 2** niet uit te voren indien je de bronomgeving al hebt geïmplementeerd via **Optie 1**.
{{% /notice %}}

De onderstaande sectie beschrijft hoe je het **CloudFormation template** kunt configureren en implementeren via de **AWS Command Line Interface (CLI)**.

1. Installeer  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Installeer <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> en <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">configureer het</a>

3. Download of clone het project van <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>

4. Creëer een unieke **S3 bucket** in the *us-west-2 (Oregon)* regio, via onderstaand commando (vervang **application-migration-workshop** met je eigen unieke **S3 bucket** naam)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Configureer het template en implementeer dat (vervang **application-migration-workshop** met je eigen unieke **S3 bucket** naam van de voorgaande stap).

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Zodra de implementatie is voltooid, zie je informatie over de geïmplementeerde bronomgeving in de AWS console zoals in onderstaande illustratie.

![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

Je kunt dit ook later terug vinden in de **AWS Console -> CloudFormation** door **ApplicationMigrationWorkshop** te selecteren en het **Outputs** blad te selecteren. Je ziet soortgelijke informatie als in onderstaande illustratie.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Nu kun je verder gaan met het opzetten van [AWS Migration Hub]({{< ref "/migration-hub.nl.md" >}})
