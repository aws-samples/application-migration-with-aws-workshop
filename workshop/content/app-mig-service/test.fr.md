+++
title = "Lancement du test de réplication"
weight = 50
+++

Avant de finaliser la migration, nous devons faire un test. 

1. Allez dans les détails du serveur et cliquez sur le bouton **Test and Cutover**, puis à partir du menu choisissez **Launch test instance**.

    ![Launch test instance](/app_mig_serv/launch_test_instance.en.png)

    Confirmez le lancement puis attendez le lancement de la machine de test. Ce test permet de valider la copie du volume de démarrage et la configuration du réseau pour le serveur cible, comme défini dans **EC2 Launch Template**.

    Pour voir la progression du lancement de l'instance de test, cliquez sur **Job ID** dans la section **Lifecycle**.

    ![Job id](/app_mig_serv/testing_job_id.en.png)

    Attendez de voir la mention **Completed** du Status. Cela devrait prendre environ 10-15 minutes.

    ![Job progress](/app_mig_serv/testing_job_details.en.png)

2. Retournez dans <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Source Servers</a>, puis cliquez sur **Hostname** et **Test and Cutover** -> **Mark as "ready for cutover"**. Sélectionnez **Continue** pour confirmer que le test s'est bien passé. L'instance de test sera par conséquent terminée.

    ![Ready for cutover](/app_mig_serv/ready_for_cutover.en.png)

    Nous sommes prêt pour le [basculement]({{<ref "/launch.fr.md">}}).
