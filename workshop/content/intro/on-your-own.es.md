+++
title = "Ejecutando el taller por su propia cuenta"
weight = 20
+++

{{% notice warning %}}
Complete esta sección SOLAMENTE si está ejecutando el taller por su cuenta. Si está en un evento patrocinado por AWS (como re: Invent, GameDay, Workshop o cualquier otro evento organizado por un empleado de AWS), vaya a [Iniciar el taller en un evento de AWS]({{< ref "/migration-hub.es.md" >}}).
{{% /notice %}}


### Ambiente de aprendizaje a su propio ritmo

Este laboratorio asume que tiene acceso a **una cuenta de AWS** con <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">privilegios de administrador</a>. Para crear una nueva cuenta de AWS, siga el <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">¿Cómo creo y activo una nueva cuenta de Amazon Web Services?</a> artículo.

Las instrucciones a continuación implementarán el entorno de origen en su cuenta de AWS. Los recursos implementados consisten en dos máquinas t3.micro EC2 (una para el servidor web, otra para la base de datos), una para NAT Gateway, un API Gateway y dos funciones AWS Lambda (para recuperar fácilmente la clave de acceso EC2). El costo total de los recursos desplegados en todo el laboratorio debe ser inferior a $1 (suponiendo 4 horas de trabajo), algunos de ellos están cubiertos por el <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">nivel gratuito de AWS</a>.

¡Recuerde [limpiar]({{< ref "/cleanup/_index.es.md" >}}) su cuenta de AWS después de ejecutar el laboratorio, para evitar cargos innecesarios!

#### Opción 1: Implementación Simple

1. Haga click en el botón de abajo <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. En la sección **Step 1 - Specify template** confirme que la plantilla del URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml esté ingresada en el campo de **Amazon S3 URL** y presione **Next**
  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

3. En la sección **Step 2 - Specify stack details** asegúrese que ApplicationMigrationWorkshop esté ingresado en el campo  **Stack name** y presione **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

4. No haga ningunos cambios en la sección **Step 3 - Configure stack options** y presione **Next**  

5. En la sección **Step 4 - Review** desplácese hasta la parte inferior de la página y marque todas las casillas de verificación, como en la captura de pantalla a continuación, luego presione **Next** para que se implemente la plantilla.  
  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

Cuando la plantilla está en **CREATE_COMPLETE** puede encontrar información sobre el entorno de origen creado yendo a la **Consola de AWS -> CloudFormation**, seleccionando la pila **ApplicationMigrationWorkshop** y yendo a la pestaña **Outputs**. Verá información como en la captura de pantalla a continuación.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Copie y pegue esta información, ya que la usará durante el laboratorio.

Ahora puede habilitar [AWS Migration Hub]({{< ref "/migration-hub.es.md" >}})  




#### Opción 2: Construir todo desde el código fuente

{{% notice note %}}
No necesita continuar con la opción 2 si ya implementó el entorno con la opción 1.
{{% /notice %}}

La sección a continuación describe cómo compilar la plantilla de CloudFormation e implementarla mediante la interfaz de línea de comandos (CLI) de AWS.

1. Instale <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Instale <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> y <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">configúrelo</a>

3. Descargue o clone el proyecto desde  <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>


4. Cree un depósito S3 único en la región *us-west-2 (Oregon)*, ejecutando lo siguiente (reemplace  **application-migration-workshop** con un nombre de depósito S3 personalizado)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Construya la plantilla e impleméntela (reemplace **application-migration-workshop** con el nombre del depósito S3 personalizado creado en el paso anterior)

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. Tan pronto como finalice la implementación, verá información sobre el entorno de origen en la consola, como en la siguiente captura de pantalla.

![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

Siempre puede encontrarlo más tarde yendo a la  **Consola de AWS -> CloudFormation**, seleccione la pila de**ApplicationMigrationWorkshop** creada y vaya a la pestaña **Outputs** como en la siguiente captura de pantalla.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Ahora puede [revisar el entorno implementado]({{< ref "/review-deployment.es.md" >}})  
