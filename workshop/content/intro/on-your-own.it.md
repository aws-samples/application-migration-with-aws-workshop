+++
title = "Esegui il workshop in autonomia"
weight = 20
+++

{{% notice warning %}}
Completa questa sezione solo se decidi di eseguire il workshop in autonomia. Se partecipi a un evento ospitato da AWS (come re: Invent, Gameday, Workshop o qualsiasi altro evento ospitato da un dipendente AWS), vai a  [Partecipazione a un evento ospitato da AWS]({{< ref "/migration-hub.it.md" >}}).
{{% /notice %}}


### Ambiente di apprendimento autonomo

Questo laboratorio assume abbiate accesso ad un  **Account AWS** con <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">privilegi Amministrativi</a>. Per creare un nuovo account AWS seguire l'articolo <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">Come posso creare e attivare un nuovo account Amazon Web Services?</a> .

Le istruzioni seguenti distribuiranno l'ambiente di origine nel tuo account AWS, le risorse distribuite sono costituite da due macchine t3.micro EC2 (una per il server web, una per il database), un gateway NAT, un gateway API e due funzioni AWS Lambda (per un facile recupero di Chiave di accesso EC2). Il costo totale delle risorse distribuite in tutto il laboratorio dovrebbe essere inferiore a $1 (ipotizzando 4 ore di lavoro), alcune delle quali sono coperte dal<a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">Livello gratuito AWS</a>.

Ricordare di [ripulire]({{< ref "/cleanup/_index.it.md" >}}) il proprio account AWS dopo aver eseguito il laboratorio, per evitare addebiti non necessari!

#### Opzione 1: Distribuzione Semplice

1. Premere il pulsante sottostante <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. Sullo **Step 1 - Templatre specifico** confermare che l'URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml sia nel campo **Amazon S3 URL** e premere **Next**
  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

3. Alla schermata  **Step 2 - Specifica il dettaglio di stack**  assicurarsi che  ApplicationMigrationWorkshop sia inserito nel campo **Stack name** e premere **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

4. Alla schermata **Step 3 - Configura opzioni di stack** non effettuare nessuna modifica, quindi premere **Next**  

5. Alla schermata **Step 4 - Review** , scorrere fino alla fine della pagina e selezionare tutte le caselle di controllo, come nello screenshot qui sotto, quindi premere **Next** per distribuire il modello.  
  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

Quando il modello si trova nello stato  **CREATE_COMPLETE** puoi trovare informazioni sulla creazione dell'ambiente andando su **AWS Console -> CloudFormation**, selezionando lo stack  **ApplicationMigrationWorkshop** e andando sul tab **Outputs** . Vedrai informazioni come nello screenshot qui sotto.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Copia - incolla queste informazioni, per utilizzarle durante il laboratorio.

Ora puoi usare [AWS Migration Hub]({{< ref "/migration-hub.it.md" >}})  




#### Option 2: Costruire tutto dal codice sorgente

{{% notice note %}}
Non è necessario continuare con l'opzione 2 se è già stato distribuito l'ambiente utilizzando l'opzione 1{{% /notice %}}

La sezione seguente descrive come creare il modello CloudFormation e distribuirlo utilizzando l'interfaccia della riga di comando (CLI) di AWS.

1. Installare  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Installare <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> e <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">configurarlo</a>

3. Scarica o clona il progetto da <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>


4. Creare un univoco S3 Bucket nelle regione *us-west-2 (Oregon)* , eseguendo quanto segue (modificando **application-migration-workshop** con il nome del bucket che hai scelto)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. costruisci il modello e distribuiscilo (sostituisci **application-migration-workshop** con il nome del bucket S3 personalizzato creato nel passaggio precedente)  

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Non appena la distribuzione è finalizzata, vedrai le informazioni sull'ambiente di origine nella console, come nella schermata qui sotto.

![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

Puoi sempre trovarlo in seguito andando su **AWS Console -> CloudFormation**, seleziona lo stack creato **ApplicationMigrationWorkshop** e andando sul tab **Outputs** , come mostrato nello screenshot di sotto

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Ora puoi [rivedere l'ambiente distribuito]({{< ref "/review-deployment.it.md" >}})  
