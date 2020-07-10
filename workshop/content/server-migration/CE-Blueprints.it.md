+++
title = "Preparare Blueprint(s)"
weight = 30
+++

Mentre le istanze vengono replicate, configuriamo una **CloudEndure Target Machine Blueprint**, che è la specifica della tua macchina Target (istanza replicata) che verrà lanciata in AWS. Include parametri come il tipo di macchina (ad esempio t3.medium), **sottorete** su cui deve essere in esecuzione la macchina, indirizzo **IP privato** e tipi di disco.

Per configurare la Blueprint, vai al tab **Machines** e fai clic sul nome della macchina che desideri configurare. Quindi vai alla sezione **BLUEPRINT**.

![CE-BluePrints](/ce/CE-BluePrints.png)

Fornire le seguenti informazioni:

| Parameter                                  | Value                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Add a 'Name' Tag with value 'Webserver' |


Tutto il resto verrà lasciato come predefinito, ma esaminalo per comprendere le opzioni di configurazione disponibili disponibili per l'istanza di destinazione.

{{% notice warning %}}
Se stai seguendo questo workshop su un evento AWS, devi selezionare **Machine type** non più grande di *.large, altrimenti i tuoi privilegi IAM ti impediranno di operare su istanze create più avanti nel workshop.
{{% /notice %}}



{{% notice tip %}}
Se non vedi i campi di input nella pagina BLUEPRINT o è difficile scorrere attraverso di essi, ridimensiona lo schermo (Control -).
{{% /notice %}}

Al termine, fai clic sul pulsante **SAVE BLUEPRINT** nella parte inferiore della pagina.
