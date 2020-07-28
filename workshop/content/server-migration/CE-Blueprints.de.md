+++
title = "Vorbereitung von Blueprint(s)"
weight = 30
+++

Während die Instanzen repliziert werden, konfigurieren wir einen **CloudEndure Target Machine Blueprint**, 
der die Spezifikation Ihres Zielservers (replizierte Instanz) darstellt, der in AWS gestartet wird. 
Es enthält Parameter wie Maschinentyp (z. B. t3.medium), **Subnet**, 
in dem der Server ausgeführt werden soll, eine **private IP-Adresse** und Festplattentypen.

Um den Blueprint zu konfigurieren, gehen Sie zum **Maschines** Tab und klicken Sie 
auf den Namen der Maschine bitte, die Sie konfigurieren möchten. 
Navigieren Sie dann zu **BLUEPRINT**.

![CE-BluePrints](/ce/CE-BluePrints.png)

Tragen Sie folgende Informationen ein:

| Parameter                                  | Value                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Add a 'Name' Tag with value 'Webserver' |

Alles andere wird als Standard beibehalten. Überprüfen Sie es jedoch 
die verfügbaren Konfigurationsoptionen für Ihre Zielinstanz.

{{% notice warning %}}
Bei Teilnahme an einen von **AWS gehosteten Workshop**, 
wählen Sie bitte einen **Maschine type** aus, der nicht größer als *.large ist. 
Andernfalls wird Ihre IAM-Berechtigungen verhindern, dass Sie später im Workshop 
an erstellten Instanzen arbeiten können.
{{% /notice %}}

{{% notice tip %}}
Wenn Sie auf bei der Blueprint-Seite keine Eingabefelder sehen können, 
oder es ist schwierig, durch diese zu scrollen, verkleinern Sie bitte die angezeigte Größe Ihres Webbrowsers (Strg -).
{{% /notice %}}

Wenn Sie fertig sind, klicken Sie bitte auf **BLUEPRINT SPEICHERN** darauf.
