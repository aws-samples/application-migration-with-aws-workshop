+++
title = "Rodando o workshop sozinho"
weight = 20
+++

{{% notice warning %}}
Só complete essa seção se você estiver o workshop sozinho. Se você estiver num evento da AWS (re:Invent, Gameday, Workshop ou qualquer outro evento hospedado por um colaborador da AWS), vá para [Iniciar o workshop num evento AWS]({{< ref "/migration-hub.pt.md" >}}).
{{% /notice %}}


### Ambiente de aprendizado solo

Este lab assume que você tem acesso a uma **AWS Account** com <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">privilégios administrativos</a>. Para criar uma nova conta AWS siga <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">Como criar e ativar uma nova conta AWS? </a>.

As instruções abaixo irão instalar um ambiente origem na sua conta, os recursos instalados consistem de duas máquinas t3.micro EC2 (uma para webserver, uma para banco de dados), um NAT Gateway, um API Gateway e duas funções AWS Lambda (para recuperar facilmente a EC2 Access Key). O custo total dos recursos implementados por este lab deve ser de aproximadamente US$5 (assumindo 4 horas de trabalho), alguns custos são cobertos pelo <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">AWS Free tier</a>.

Lembre-se de [limpar]({{< ref "/cleanup/_index.pt.md" >}}) sua conta AWS depois de rodar o lab, para evitar custos desnecessários!

#### Opção 1: Implementação Simples

1. Clique no botão abaixo <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. No **Step 1 - Specify template** confirme que a URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml está no campo **Amazon S3 URL** e aperte **Next**
  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

4. Na tela **Step 2 - Specify stack details**  certifique-se que ApplicationMigrationWorkshop foi inserido como o campo **Stack name** e aperte **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

5. Na tela **Step 3 - Configure stack options** não modifique nada, apenas aperte **Next**  

6. Na tela **Step 4 - Review**, role até o final da tela e marque todas as caixas de checagem, como indicado na imagem abaixo, então aperte **Next** para instalar o template.  
  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

Quando o template estiver como **CREATE_COMPLETE** você poderá econtrar as informações sobre o ambiente origem criado indo em **AWS Console -> CloudFormation**, selecionando a stack  **ApplicationMigrationWorkshop** e abrindo a aba **Outputs**. A informação será parecida com a tela abaixo.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Copie e cole esta informação, você precisará dela durante o lab.

Agora você pode habilitar o [AWS Migration Hub]({{< ref "/migration-hub.pt.md" >}})  




#### Opção 2: Construindo o ambiente a partir do código fonte

{{% notice note %}}
Você não precisa continuar com a opção 2 caso já tenha implementado o ambiente com a opção 1
{{% /notice %}}

A seção abaixo demonstra como construir o CloudFormation template e implementá-lo usando a AWS Command Line Interface (CLI).

1. Instale o  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Instale o <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> e <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">configure-o</a>

3. Baixe ou clone o projeto de <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>


4. Crie um balde S3 único na região *us-west-2 (Oregon)*, rodando o seguinte comando (substitua **application-migration-workshop** com um nome único para este balde S3)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Construa o template e instale-o (substitua **application-migration-workshop** pelo nome do balde S3 do passo anterior)  

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Assim que a implementação finalizar, você verá informações sobre o ambiente origem na console, como a imagem abaixo.

![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

Você sempre pode voltar para **AWS Console -> CloudFormation**, selecionar a stack criada **ApplicationMigrationWorkshop** e ir até a aba **Outputs**, como na imagem abaixo.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Agora você pode [revisar o ambiente implementado]({{< ref "/review-deployment.pt.md" >}})  
