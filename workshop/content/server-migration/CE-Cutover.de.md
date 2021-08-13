+++
title = "Inbetriebnahme"
weight = 40

+++
### CloudEndure-Migration Test und Inbetriebnahme

Sobald Sie die Replikation der Volumes abgeschlossen haben (der Status neben dem Computernamen lautet 
**Continuous Data Replication**), können Sie einen **Test/Cutover(Inbetriebnahme)** durchführen.

Jedes Mal, wenn Sie den **Test/Cutover** starten, löscht CloudEndure-Migration alle zuvor 
erstellten Instanzen und erstellt eine **neue Zielinstanz/new Target instance**, 
die mit der neuesten Kopie der Daten aus der Quellumgebung auf dem neuesten Stand ist.

{{% notice note %}}
Gemäß bewährten Methoden und im wirklichen Leben sollten Sie eine **Test**-Migration 
mindestens **eine Woche** vor dem angestrebten Migrationsdatum durchführen. 
Dies dient dazu, potenzielle Herausforderungen mit Ihrer Blueprint-Konfiguration 
oder mit der replizierten Volume-Konvertierung identifizieren und beheben zu können.
In diesem Labor führen Sie eine **Inbetriebnahme (Cutover)** durch 
(diese Instanzkonvertierung in unserem Setup, wurde mehr als 3.000 Mal durchgeführt, 
wir wissen also, dass sie funktioniert!).
{{% /notice %}}


1. Stellen Sie sicher, dass die Volumes vollständig repliziert sind
    Bestätigen Sie, dass in der **DATA REPLICATION PROGRESS** Spalte sich die Instanz im Status **Continuous Data Replication** befindet.

    Wenn es immer noch repliziert wird, warten Sie, bis der Status **Continuous Data Replication** erreicht wird. 
    Während des Wartens können Sie die <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">CloudEndure-Dokumentation</a> lesen.

2. Aktiviere die Inbetriebnahme

    Wählen Sie aus der **Machines** Liste den Server aus, den Sie ausschalten möchten, 
    und klicken Sie auf die Schaltfläche **LAUNCH 1 TARGET MACHINE** darauf in der oberen 
    rechten Eck des Bildschirms, dann **Cutover Mode** und **CONTINUE** im Bestätigungs-Popup.
  
    From the **Machines** list select the server that you want to Cutover, click **LAUNCH 1 TARGET MACHINE** button 
    in the top right corner of the screen, then **Cutover Mode** and **CONTINUE** in the confirmation popup.
    
    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure führt nun eine endgültige Synchronisierung/Momentaufnahme (sync/snapshot) des Volumes durch 
    und beginnt mit dem Aufbau neuer Server in der Zielinfrastruktur, wobei die Datenkonsistenz erhalten bleibt. 
    Weitere Informationen finden Sie im **Job Progress** Bildschirm.

    ![CE-job-progress](/ce/CE-job-progress.png)

    Überwachen Sie das Protokoll **Job Progress**, bis die **Finished starting converters** Meldung angezeigt wird 
    (dies sollte 3-5 Minuten dauern). 
    In der Zwischenzeit können Sie die <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">CloudEndure-Dokumentation mit Details zu einer Inbetriebnahme/einem Cutover-Prozess</a> 
    überprüfen.

{{% notice tip %}}
Wenn Sie Ihren Job nicht im Fenster **Job Progress** sehen, 
aktualisieren Sie den Browser (F5) und scrollen Sie zum Anfang der Dropdown-Liste der CloudEndure-Jobs.
{{% /notice %}}

1. Überprüfen Sie die von CloudEndure in Ihrem AWS-Konto erstellten Ressourcen
   
    Wechseln Sie zurück zur **AWS-Konsole** und navigieren Sie bei Bedarf zu Ihrer Ziel-AWS-Region (US-West-2/Oregon).
   
    Sie werden zwei zusätzliche Instanzen sehen, die von CloudEndure erstellt wurden::
    - **CloudEndure Machine Converter** - Wird für die Konvertierung des Quell-Boot-Volumes verwendet, 
    um AWS-spezifische Bootloader-Änderungen vorzunehmen, Hypervisor-Treiber einzufügen und Cloud-Tools zu installieren. 
    Es läuft einige Minuten pro Test/CutOver/Inbetriebnahme-Umstellung.
    - **CloudEndure Replication Server** - wird verwendet, um verschlüsselte Daten von Agenten zu empfangen, 
    die in der Quellumgebung installiert sind. Es wird ausgeführt, wenn die Replikation von Daten stattfindet. 

    Beide Instanztypen werden vollständig von CloudEndure verwaltet und sind für Benutzer NICHT zugänglich.

    Sobald die Umstellung abgeschlossen ist, wird eine weitere EC2-Instanz in der Liste angezeigt. 
    Dies ist Ihr von CloudEndure erstellter Ziel-Webserver. 
    Notieren Sie sich die öffentlichen und privaten IP-Adressen, da Sie diese im nächsten Schritt benötigen werden.

{{% notice tip %}}
Weitere Informationen zu diesen Servern, ihrem Zweck und ihren Netzwerkanforderungen 
finden Sie unter <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">CloudEndure-Dokumentation</a> URL.
{{% /notice %}}
