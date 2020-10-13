+++
title = "Maak de Blueprints aan"
weight = 30
+++

Terwijl de replicatie van de servers plaatsvindt, kun je de **CloudEndure doelomgeving blueprint** aanmaken. Deze blueprint is de specificatie van de server in de doelomgeving die zal worden geïmplementeerd in AWS. Deze blueprint bevat parameters zoals het type EC2 machine (bijvoorbeeld example t3.medium), **subnet** waar de machine geplaatst wordt, **private IP** adres en het type en de grootte van de gekoppelde disks.

Om een blueprint te configureren, ga naar het **Machines** werkblad en druk opde naam van de machine die je wilt configureren. Ga dan naar de **BLUEPRINT** sectie.

![CE-BluePrints](/ce/CE-BluePrints.png)

Voer de onderstaande informatie in:

| Parameter                                  | Waarde                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Add a 'Name' Tag with value 'Webserver' |


Alle andere configuratie kun je laten staan op de standaardinstellingen, maar kijk er wel even naar zodat je de mogelijke configuratie-opties goed begrijpt.

{{% notice warning %}}
Indien de deze workshop uitvoert tijdens een **AWS Event**, kies dan geen EC2**Machine type** groter dan *.large, anders loop je tegen restricties aan met je IAM privileges tijdens de rest van de workshop.
{{% /notice %}}

{{% notice tip %}}
Indien je de inputvelden niet ziet op de **BLUEPRINT pagina** of je hebt moeite met scrollen, zoom dan uit in je browser window (Control -).
{{% /notice %}}

Wanneer je klaar bent, druk dan op **SAVE BLUEPRINT** onderaan de pagina.