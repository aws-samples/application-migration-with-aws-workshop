+++
title = "Den Workshop eigenständig durchführen"
weight = 20
+++

{{% notice warning %}}
Führen Sie diesen Abschnitt nur aus, wenn Sie den Workshop selbst durchführen. 
Wenn Sie an einer von AWS gehosteten Veranstaltung teilnehmen (z. B. re: Invent, 
Spieltag, Workshop oder eine andere von einem AWS-Mitarbeiter veranstaltete 
Veranstaltung), gehen Sie zu Start des Workshops bei einer AWS-Veranstaltung. [Start the workshop at an AWS event]({{< ref "/migration-hub.de.md" >}}).
{{% /notice %}}


### Lernen im eigenen Tempo
In dieser Übung wird davon ausgegangen, dass Sie Zugriff auf ein AWS-Konto mit 
<a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">Administratorrechten</a> 
haben.

Um ein neues AWS-Konto zu erstellen, folgen Sie bitte 
<a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">
How do I create and activate a new Amazon Web Services account?</a> Artikel.


Die folgenden Anweisungen stellen die Quellumgebung in Ihrem AWS-Konto bereit. 
Die bereitgestellten Ressourcen bestehen aus von zwei t3.micro EC2-Maschinen 
(eine für den Webserver, eine für die Datenbank), ein NAT-Gateway, ein API-Gateway und zwei
AWS Lambda-Funktionen (zum einfachen Abrufen des EC2-Zugangsschlüssels).

Die Gesamtkosten der im gesamten Umgebung von bereitgestellten Ressourcen sollten 
weniger als 5 US-Dollar betragen (unter der Annahme von 4 Arbeitsstunden).
Einige von ihnen werden von <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer"> AWS Free Tier </a> abgedeckt.

Denken Sie bitte daran, alle Ressourcen in Ihrem AWS-Konto nach dem Ausführen des Workshops zu [entfernen]({{<ref "/cleanup/_index.de.md">}}), um unnötige Kosten zu vermeiden!

#### Option 1: Einfache Deployment

1. Klicken Sie bitte auf die "Launch Stack" Schaltfläche <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. Als erste Schritt **Step 1 - verifizieren Sie, ob die richtige Vorlage (YAML Template) ausgewählt wurde.** 
Bestätigen sie ob das Link https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml 
richtig bei **Amazon S3 URL** Feld eingetragen wurde und wählen Sie **Next**

  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

4. Als zweite Schritt **Step 2 - Specify stack details**, verifizieren Sie bitte ob ApplicationMigrationWorkshop 
wurde in **Stack name** Feld eingetragen und wählen Sie **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

5. Als dritte Schritt **Step 3 - Configure stack options**, übernehmen Sie bitte die Standardkonfiguration 
und wählen Sie **Next**  

6. Als weitere Schritt **Step 4 - Review** Scrollen Sie bitte zum Ende der Seite und aktivieren 
Sie alle Kontrollkästchen (siehe Abbildung unten) und dann drücken Sie bitte auf die **Next** weiter 
um die Vorlage zu ausführen .

  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

Wenn sich die Vorlage in **CREATE_COMPLETE** Status befindet, finden Sie Informationen zur erstellten Quellumgebung.
Gehen Sie bitte zu **AWS Console -> CloudFormation**, wählen Sie **ApplicationMigrationWorkshop** Stack aus 
und gehen Sie auf die Registerkarte **Outputs**. Sie sollen die Informationen wie auf dem Screenshot unten sehen können.

  ![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Kopieren Sie bitte die Information und halten Sie sie bereit. Sie werden sie immer wieder während des Workshops benötigen. 

Jetzt können Sie [AWS Migration Hub]({{< ref "/migration-hub.de.md" >}}) aktivieren.  




#### Option 2: Alles aus dem Quellcode erstellen

{{% notice note %}}
Sie müssen nicht mit der Option 2 fortfahren, wenn Sie die Umgebung bereits mit der Option 1 aufgebaut haben.
{{% /notice %}}

Im folgenden Abschnitt wird beschrieben, wie Sie die CloudFormation-Vorlage erstellen und mithilfe 
der AWS Command Line Interface (CLI) bereitstellen.

1. Installieren Sie  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Installieren Sie <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> 
und <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">konfigurieren</a> Sie sie.

3. Laden Sie das Projekt runter oder klonen Sie es bitte <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>

4. Erstellen Sie bitte einen neuen, eindeutigen S3-Bucket in der Region us-west-2 (Oregon), 
indem Sie Folgendes ausführen (ersetzen Sie den **Application-Migration-Workshop** durch einen benutzerdefinierten S3-Bucket-Namen).

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Erstellen Sie die Vorlage und stellen Sie sie bereit (ersetzen Sie **Application-Migration-Workshop** durch den 
im vorherigen Schritt erstellten benutzerdefinierten S3-Bucket-Namen).

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Sobald die Bereitstellung abgeschlossen ist, werden in der Konsole Informationen zur Quellumgebung angezeigt, 
   wie auf dem Screenshot unten.

  ![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

Sie können es jederzeit später finden, indem Sie unter **AWS Console -> CloudFormation** die Option "Created Stacks" 
auswählen **ApplicationMigrationWorkshop** Stack und zur dem Tab **Outputs** wechseln, 
wie im folgenden Screenshot dargestellt.

  ![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Jetzt können Sie die [aufgebaute Umgebung überprüfen]({{< ref "/review-deployment.de.md" >}})  
