+++
title = "Voer de omschakeling uit"
weight = 40

+++
### CloudEndure Migratie Test- en definitieve omschakeling

Wanneer de replicatie van de disk volumes gereed is (de status afgebeeld naast de naam van de machine staat dan op **Continuous Data Replication**), ben je klaar voor de test- of definitieve omschakeling.

Elke keer als je een omschakeling start, zal CloudEndure Migration eerst EC2 machines die aangemaakt zijn bij voorgaande omschakelingen verwijderen en **nieuwe machines in de doelomgeving aanmaken** die bijgewerkt zijn met de meest recente kopie van de data van de bronomgeving.

{{% notice note %}}
Volgens de aanbevelingen en ook als je een migratie in het echt doet, is het aan te raden om altijd eertst een testomschakeling te doen en dit één maal per week te blijven doen totaan de datum van de definitieve omschakeling. Hierdoor kun je voortijdig problemen ontdekken met je Blueprint configuratie en/of met de gerepliceerde data en deze oplossen.  
In deze workshop ga je direct voor de definitieve omschakeling (**Cutover**). Deze omschakeling is reeds ruim 3000 maal getest dus we weten dat het werkt!
{{% /notice %}}


1. Controleer dat de disk volumes volledig gesynchroniseerd zijn
   
    Verifieer dat de status van de machine **Continuous Data Replication** is. Dit staat in de **DATA REPLICATION PROGRESS** kolom.

    Indien de machine nog niet volledige in sync is, wacht totdat de status **Continuous Data Replication** is bereikt. Terwijl je wacht kun je wellicht even de <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">CloudEndure documentatie</a> bekijken.

2. Start de omschakeling
   
    Van de lijst van **Machines**, selecteer de machine die je wilt omschakelen. Druk op de **LAUNCH 1 TARGET MACHINE** knop in de rechterbovenhoek van het scherm. Kies dan **Cutover Mode** en druk op **CONTINUE** in de pop-up window.

    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure maakt nu een laatste sync/backup van de disk volumes en start he proces om de nieuwe machines in de doelomgeving aan te maken. Gedurende dit proces word de data in sync gehouden. Kijk op het **Job Progress** scherm voor meer informatie en details.

    ![CE-job-progress](/ce/CE-job-progress.png)

    Volg de voortgang van de omschakeling via **Job Progress** totdat je **Finished starting converters** ziet (dit kan 3-5 minuten duren). Terwijl je wacht, bekijk <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">CloudEndure Documentatie met informatie en details over het omschakelingsproces.</a>.


    {{% notice tip %}}
Indien je de omschakelingstaak niet kunt zien in het **Job Progress** scherm, ververs dan je browser (F5) en scroll naar de top van de lijst van CloudEndure jobs.
{{% /notice %}}

1. Verifieer de resources aangemaakt door CloudEndure in jouw AWS account
   
    Ga terug naar de **AWS Console** en selecteer de AWS region voor de doelomgeving indien nodig (US-west-2/Oregon).
   
    Je zult 2 additionele, door CloudEndure beheerde machines zien:
    - **CloudEndure Machine Converter** - wordt gebruikt voor de conversie van het boot volume in de bronomgeving, het maken van AWS-specifieke bootloader aanpassingen, toevoegen van hypervisor drivers en het installeren van cloud tools. Deze machine draait voor een aantal minutes tijdens een test- of definitieve omschakeling.
    - **CloudEndure Replication Server** - wordt gebruikt voor ontvangen van versleutelde data van de geïnstalleerde agents in de bronomgeving. Deze machine draait zolang replicatie plaatsvindt.

    Beide machines worden volledig beheerd door CloudEndure en zijn niet toegankelijk voor de gebruikers.

    Zodra de omschakeling is voltooid, zie je nog een EC2 machine in de lijst - Dit is de nieuwe web server in de doelomgeving die door CloudEndure is aangemaakt. Noteer het public en private IP adres, want dat hebben we nodig in de volgende stap.

    {{% notice tip %}}
Indien je meer wilt weten over deze machines, hun gebruik en netwerkvereisten, kijk dan naar de <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">CloudEndure Documentatie</a>.
{{% /notice %}}