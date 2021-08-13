+++
title = "Installieren Sie Agenten auf den Quellservern"
weight = 20
+++


In der <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure Konsole</a>, wählen Sie **Machines** 
eine **How to Add Machines** Schritt-für-Schritt Anleitung wird angezeigt. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Installieren Sie Agenten auf einem Webserver

1. Rufen Sie die Quell-Webserver-Informationen ab

    Für den Workshop **in einem eigenem AWS-Konto** - finden Sie die Informationen in Ihren CloudFormation Stack **Output** 
    von **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Bei Teilnahme an eine von **AWS gehostete Veranstaltung** - es wird unter **Webserver IP**, 
    **Webserver Username** und **Webserver SSH Key** 
    im <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> beschrieben. 

    ![Centos-pem](/ce/Centos-pem.png)

2. Laden Sie den **Webserver SSH-Schlüssel** (.pem) herunter und speichern Sie ihn (z. B. als **webserver.pem** -Datei) lokal.

    Wenn Sie ein Microsoft Windows-Betriebssystem verwenden, 
    konvertieren Sie die .pem-Datei mit dem SSH-Schlüssel mithilfe von PuttyGen 
    in .ppk und stellen Sie dann mit Putty eine Verbindung her 
    (mehr Informationen <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">finden Sie hier</a>).  

3. Stellen Sie über das SSH-Terminal eine Verbindung zum **Source Webserver** her.

    Eine Anleitung für die Microsoft Windows Benutzer <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">finden Sie hier</a>.  
    Eine Anleitung für die Mac OS/Linux Benutzer <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">finden Sie hier</a>.

4. Führen Sie die Befehle aus, die vom **How to Add Machines** kopiert wurden, 
um den Agenten herunterzuladen und zu installieren: 

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    Bei ordnungsgemäßer Ausführung erhalten Sie eine Meldung, dass die Installation 
    erfolgreich abgeschlossen wurde (**Installation finished successfully**).
    
{{% notice tip %}}
Befehle zum Installieren des Agenten erhalten Sie auch über 
die **CloudEndure**-Konsole **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Sobald der Agent installiert ist, wird der Server auf der Registerkarte 
**CloudEndure-Konsole** -> **Machines** angezeigt, wie auf der Darstellung unten. 

    ![CE-server-progress](/ce/CE-server-progress.png)
