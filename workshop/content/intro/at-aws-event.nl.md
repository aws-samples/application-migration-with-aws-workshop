+++
title = "Uitvoeren van de workshop tijdens een AWS Event"
date = 2019-10-24T10:02:15+02:00
weight = 30
+++

{{% notice warning %}}
Dit deel alleen uitvoeren indien de workshop plaatsvindt tijdens een AWS event (zoals re:Invent, GameDays, Workshop of een ander door een AWS medewerker georganiseerd event). 
Indien je de workshop zelfstandig wilt doen, ga dan naar: [Begin de workshop zelfstandig]({{< ref "/on-your-own.nl.md" >}})
{{% /notice %}}

### Toegang tot het Dashboard

De onderstaande instructies beschrijven waar je informatie vindt over de bronomgeving wanneer de workshop plaatsvindt tijdens een AWS event.

- Ga naar <a href="https://dashboard.eventengine.run/" target="_blank">https://dashboard.eventengine.run/</a>

- Voer de ontvangen 12-cijferige code (team hash) in.


  ![dashboard-hash](/intro/dashboard-hash.png)


### Toegang tot de bronomgeving 

In de **Migration GameDay** module, onder het **Outputs** sectie, kun je de informatie over de **bronomgeving** vinden. Zie onderstaand voorbeeld:

  ![dashboard-output](/intro/src-env-output.png)


### Toegang tot je AWS Account

Om toegang te krijgen tot je AWS account, druk op de **AWS Console** knop


![dashboard-AWS-console](/intro/dashboard-aws-console.png)


In een nieuw venster word je gevraagd of je de console wilt openen in je huidige browser (**Open Console**) of dat je de link wilt kopieëren (**Copy Login Link**) om de console in een andere browser te openen.  
{{% notice note %}}
Open de AWS Console _voordat_ je verder gaat.
{{% /notice %}}

![dashboard-console-login](/intro/dashboard-console-login.png)


{{% notice note %}}
De inloggegevens in het venster kun je gebruiken indien je de AWS CLI (<a href="https://aws.amazon.com/cli/" target="_blank">Command Line Interface</a>) wilt gebruiken in plaats van de AWS console. Gebruik deze inloggegevens **niet** in de **AWS credentials** sectie in CloudEndure (omdat deze daar niet werken).
{{% /notice %}}

Nu kun je verder gaan met het opzetten van [AWS Migration Hub]({{< ref "/migration-hub.nl.md" >}})
