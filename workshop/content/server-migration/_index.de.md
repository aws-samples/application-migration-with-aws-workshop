+++
title = "Servermigration"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### CloudEndure Servermigration Übersicht

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Servermigration</a> 
ermöglicht es Unternehmen, selbst die komplexesten Workloads ohne Unterbrechung oder Datenverlust 
auf Amazon Web Services (AWS) zu migrieren. 
Durch kontinuierliche Replikation auf Blockebene, automatisierte Maschinenkonvertierung und 
Anwendungsstapel-Orchestrierung vereinfacht **CloudEndure Migration** den Migrationsprozess 
und verringert das Risiko menschlicher Fehler.

Unabhängig davon, ob Sie auf AWS oder über Regionen innerhalb von AWS migrieren, 
bietet Ihnen **CloudEndure Migration** die Flexibilität, die Sicherheitskontrollen, die Sie benötigen, 
um im schnelllebigen digitalen Ökosystem von heute erfolgreich zu sein.

![cloudendure-intro](/ce/ce-home.png)

**Vorteile von CloudEndure Live Migration:**

- Cutover Migrationszeitfenster von Minuten und kein Datenverlust
- 100% Datenintegrität für alle Anwendungen (einschließlich Datenbanken und Legacy-Anwendungen)
- Umfangreiche Migrationen und ohne Auswirkungen auf die Leistung
- Breite Unterstützung für Plattform- und Quellbetriebssysteme
- Automatisierte Migrationen zur Minimierung von IT-Ressourcen und Projektlänge

{{% notice note %}}
**CloudEndure Migration** ist verfübar ohne **Zusatzkosten** für alle Migrationen nach AWS.  
Besuchen Sie <a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">CloudEndure Migration Registration page</a> 
um ein Account zu erstellen und eine Migration zu AWS zu starten!
{{% /notice %}}  

Efahren Sie mehr über **CloudEndure Migration** mit folgendem Video:
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Währen diesem Schritt führen Sie ein Re-Hosting (auch als Lift- und Shift-Migration bezeichnet) 
des Webservers durch, indem Sie die folgenden Aktivitäten ausführen:

1. [CloudEndure Configuration]({{< ref "/CE-Configuration.de.md" >}}) - Konfiguration von CloudEndure-Dienst  
2. [Install Agent on Source Machine(s)]({{< ref "/CE-Agent-Installation.de.md" >}}) - Installation von Softwareagenten
3. [Prepare Blueprint]({{< ref "/CE-Blueprints.de.md" >}}) - Erstellen von einem Muster
4. [Do the Cutover]({{< ref "/CE-Cutover.de.md" >}})  - Umschalten der Umgebung
5. [Configure Application]({{< ref "/CE-Webserver-config.de.md" >}}) - Anpassung der Konfiguration von der migrierte Applikation
