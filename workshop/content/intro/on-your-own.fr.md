+++
title = "Dérouler le workshop de manière indépendante"
weight = 20
+++

{{% notice warning %}}
N'exécutez cette section que si vous déroulez le workshop de manière indépendante. Si vous participez à un évènement AWS (comme re:Invent, Gameday, Workshop, ou quelque évènement organisé par un employé AWS) , aller à [Dérouler le workshop à un évènement AWS]({{< ref "/migration-hub.fr.md" >}}).
{{% /notice %}}

### Environnement d'apprentissage pour le workshop à son rythme

Pour ce lab nous considérons que vous disposez d'un accès a un **compte AWS** avec <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">des droits administrateur</a>. Pour créer un nouveau compte AWS, merci de suivre <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">How do I create and activate a new Amazon Web Services account?</a> article.

Les instructions ci-dessous vous permettrons de déployer l'environnement source dans votre compte AWS, les ressources déployées consistent en deux minstances EC2 t3.micro (une pour le serveur web, une pour le serveur de base de données), une "NAT Gateway", une "API Gateway" et deux fonctions AWS Lambda (pour une récupération simple de l'access key EC2). Le coût total de déployement des ressources nécessaires pour ce lab doit être inférieur à $5 (considérant 4 heures de travail pour le workshop), certains coûts sont couvert par le<a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">Free tier AWS</a>. 

N'oubliez pas de [nettoyer]({{< ref "/cleanup/_index.fr.md" >}}) votre compte AWS après avoir terminé la lab afin d'éviter des dépenses inutiles !

#### Option 1: Déploiement simple

1. Cliquez sur le bouton <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. dans l'écran **Step 1 - Specify Template** confirmez que l'URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml est entrée dans le champ **Amazon S3 URL** et pressez **Next**
  ![CloudFormation Etape 1](/intro/cloudformation-step1.en.png)

4. dans l'écran **Step 2 - Specify stack details** assurez-vous que ApplicationMigrationWorkshop est entré dans le champ **Stack name** et appuyer sur **Next**
   ![CloudFormation Etape 2](/intro/cloudformation-step2.en.png)

5. Dans l'écran **Step 3 - Configure stack options** ne faites aucun changement, appuyez seulement sur **Next**  

6. dans l'écran **Step 4 - Review** paginez jusqu'en bas de la page et cochez toutes les cases comme indiqué dans la copie d'écan ci-dessous, appuyez sur **Next** pour déployer le "template". 
  ![CloudFormation Etape 4](/intro/cloudformation-step4.en.png)

Lorsque le "template" est en statut **CREATE_COMPLETE** vous pouvez trouver les informations concernant les ressources créées en allant dans **AWS Console -> CloudFormation**, sélectionnez la "stack"  **ApplicationMigrationWorkshop** et aller dans l'onglet **Outputs**. Vous verrez les informations comme présentées dans la copie d'acran ci-dessous.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Copiez - Collez ces informations, elle vous serons utiles durant le workshop.

Maintenant vous pouvez activer [AWS Migration Hub]({{< ref "/migration-hub.fr.md" >}})  




#### Option 2: Tout construire à partir du code source

{{% notice note %}}
Vous n'avez pas besoin de continuer avec l'option 2 si vous avez déjà déployé l'environnement selon l'option 1
{{% /notice %}}

La section ci-dessous décrit comment constuire le "Template" CloudFromation et le déployer en utilisant AWS Command Line Interface (CLI).

1. Installer  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Installer <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> et <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">le configurer</a>

3. Télécharger ou clôner le projet à partir de <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>


4. Créer un "Bucket" S3 unique dan la région *us-west-2 (Oregon)*, en éxécutant la commande suivante (remplacer **application-migration-workshop** avec un nom de "Bucket" S3 personalisé)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Construisez le "Template" et déployez le (remplacez **application-migration-workshop** avec le nom du "Bucket" S3 personalisé créé à l'étape précédente)  

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Dès que le déploiement est terminé, vous verrez les informations de l'environnement source dans la console, comme dans la copie d'écran ci-dessous.

![Environnemnt source dans le CLI](/intro/self-service-env-cli-info.en.png)

Vous pourrez toujours retrouver ces informations plus tard en allant dans **AWS Console -> CloudFormation**, sélectionnez la "Stack" **ApplicationMigrationWorkshop** créée et allez dans l'onglet **Outputs**, comme dans la copie d'écran ci-dessous.

![Environnement source dans la console AWS](/intro/self-service-env-awsconsole-info.en.png)

Maintenant vous pouvez activer [AWS Migration Hub]({{< ref "/migration-hub.fr.md" >}})  
