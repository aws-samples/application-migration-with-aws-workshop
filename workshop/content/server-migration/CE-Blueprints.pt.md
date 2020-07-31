+++
title = "Prepare o(s) Blueprint(s)"
weight = 30
+++

Enquanto as máquinas são replicadas, vamos configurar o **CloudEndure Target Machine Blueprint**, que é uma especificação da sua máquina destino (instância replicada) que será lançada na AWS. Ele inclui parâmetros como tipo de máquina (por exemplo t3.medium), **subnet** onde a máquina rodará, endereço **private IP** e tipo de disco.

Para configurar o Blueprint, vá até a aba **Machines** e clique no nome da máquina que deseja configurar. Então navegue até a seção **BLUEPRINT**.

![CE-BluePrints](/ce/CE-BluePrints.png)

Preencha a seguinte informação:

| Parameter                                  | Value                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Adicione um 'Name' Tag com o valor 'Webserver' |


Todo o resto deixe como default, mas revise as opções para entender as configurações disponíveis para a instância destino.

{{% notice warning %}}
Caso esteja realizando este workshop num Evento AWS, você tem de selecionar um **Machine type** que não seja maior do que *.large, senão seus privilégios IAM irão limitar a operação da instância criada mais adiante neste workshop.
{{% /notice %}}



{{% notice tip %}}
Caso não veja os campos para entrada das configurações no BLUEPRINT, reduza o zoom da sua tela (Control -).
{{% /notice %}}

Quando terminar, clique o botão **SAVE BLUEPRINT** no fim da página.
