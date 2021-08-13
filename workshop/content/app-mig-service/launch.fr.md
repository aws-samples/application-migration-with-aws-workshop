+++
title = "Lancement du cutover"
weight = 60
+++

1. Lancement du "cutover"
 
    Cliquez sur **Test and Cutover** -> **Launch cutover instance** puis confirmez **Launch**.

    ![Launch cutover](/app_mig_serv/launch_cutover_popup.en.png)

    Cette étape lance le job. Les détails sont visibles en cliquant sur **Cutover Job ID** dans **Lifecycle section**.  

    ![Launch cutover](/app_mig_serv/launch_cutover.en.png)  

    {{% notice warning %}} Si vous voyez une erreur avec le texte en anglais **Failed to launch cutover instances. One or more of the Source Servers included in API call are currently being processed by a Job**, cela signifie que l'instance de test n'a toujours pas été stoppée et terminée. Vérifiez ses progrès sur la page <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/launchHistory" target="_blank" rel="noopener noreferrer">Launch history</a>. Attendez de voir **Terminate** puis relancer à nouveau le job **Launch cutover instance**.  
{{% /notice %}}   

2. Attente du Cutover terminé

    Attendez de voir **Launch status** passer de **Waiting** à **Launched** / **First boot: Started**. Pendant cette étape, le serveur cible sera visible dans la liste des instances EC2 dans **EC2 Console** avec le status **Running**.

    ![Launch succesful](/app_mig_serv/launch_status_launched.en.png)

3. Finalisation du cutover

    Cliquez sur **Test and Cutover** -> **Finalize cutover**, puis confirmez la finalisation du cutover pour lancer le nettoyage des ressources utilisées par **AWS Application Migration Service**. Le serveur cible ne sera bien évidemment pas impacté et toujours visible dans **EC2 Console**!

    ![Finalize cutover](/app_mig_serv/finalize_cutover.en.png)
   
    La dernière étape consiste à [configurer l'application]({{<ref "/webserver_config.fr.md">}}) sur le serveur cible.
