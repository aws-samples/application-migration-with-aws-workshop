+++
title = "Preparar los planos (Blueprints) de los servidores"
weight = 30
+++

Mientras se replican las instancias, configuremos un **CloudEndure Target Machine Blueprint**, que es la especificación de su máquina de destino (o Target) (instancia replicada) que se lanzará en AWS. Incluye parámetros como el **tipo de máquina** (por ejemplo, t3.medium), la **subred** donde se debe ejecutar la máquina, la dirección **IP privada** y los tipos de disco.

Para configurar los planos (blueprints), vaya a la pestaña **Machines** y haga clic en el nombre de la máquina que desea configurar. Luego navegue a la sección **BLUEPRINT**.


![CE-BluePrints](/ce/CE-BluePrints.png)

Provea la siguiente información:

| Parámetros                                   | Valor                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Agregue una etiqueta de "Name" con el valor "Webserver" |


Todo lo demás se dejará como predeterminado, pero revíselo para comprender las opciones de configuración disponibles para su instancia de destino.

{{% notice warning %}}
Si está pasando por este taller en un evento de AWS, debe seleccionar el tipo de máquina (**Machine type**) no mayor que * .large, de lo contrario, sus privilegios de IAM le impedirán operar en instancias creadas más adelante en el taller.
{{% /notice %}}



{{% notice tip %}}
Si no ve los campos de entrada en la página BLUEPRINT o es difícil desplazarse por ellos, reduzca la escala de su pantalla (Control -).
{{% /notice %}}

Cuando termine, haga clic en el botón **SAVE BLUEPRINT** en la parte inferior de la página.
