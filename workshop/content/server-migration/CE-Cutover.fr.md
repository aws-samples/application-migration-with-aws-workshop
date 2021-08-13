+++
title = "Exécution du Cutover"
weight = 40

+++
### CloudEndure Migration Test/Cutover

Dès que vous avez terminé la réplication des volumes (dans ce cas le statut à côté de la machine doit indiquer **Continuous Data Replication**), vous pouvez effectuer un **Test/Cutover**.

A chaque fois que vous démarrez le **Test/Cutover**, CloudEndure Migration supprime toues les instances créées précédemment et créera une **nouvelle Target instance** qui sera à jour avec la dernière version des données de l'environnement source.

{{% notice note %}}
Selon les bonnes pratiques et dans un cadre réel, vous devez effectuer un **Test** de migration au minimum **une semaine** avant la date de migration cible. Ceci permet d'identifier les problèmes potentiels de configuration du "Blueprint" ou de volumes répliqués et de les corriger.  
Dans ce lab, vous allez réaliser un **Cutover** (Cette conversion d'instance a été réalisée au moins 3 000 fois, donc nous savons que cela fonctionne !).
{{% /notice %}}

1. Confirmez que les volumes sont complètement répliqués
   
    Confirmez que l'instance est dans l'état de **Continuous Data Replication** sous la colonne **DATA REPLICATION PROGRESS**.

    Si la réplication est toujours en cours, attendez jusqu'à qu'elle atteigne l'état **Continuous Data Replication**. En attendant, vous pouvez revoir <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">la documentation CloudEndure</a>.

2. Déclenchez le Cutover
   
    A partir de la liste **Machines** sélectionnez le serveur que vous souhaiter, cliquez sur le bouton **LAUNCH 1 TARGET MACHINE** dans le coint en haut à droite de l'écran, puis **Cutover Mode** et **CONTINUE** dans la fenêtre pop-up de confirmation.

    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure va maintenant effectuer un sync/snapshot final sur les volumes et démarrer le processus de construction des nouveaux serveurs dans l'infrastructure cible, tout en maintenant la consitance des  données. Regardez la page **Job Progress** pour plus de détails.


    ![CE-job-progress](/ce/CE-job-progress.png)

    Surveillez la log **Job Progress** jusqu'à ce que vous voyiez le message **Finished starting converters** (cela doit prendre de 3 à 5 minutes). Pendant ce temps vous pouvez revoir <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">la Documentation CloudEndure fournissant des détails sur le processus de Cutover</a>.

    {{% notice tip %}}
Si vous ne voyez pas votre job dans la fenêtre **Job Progress**, rafraîchissez votre browser (F5) et assurez-vous de paginer jusqu'en haut de la liste déroulante des jobs CloudEndure. 
{{% /notice %}}

1. Vérifiez les ressources créées par CloudEndure dans votre compte AWS
   
    Basculer vers la **Console AWS** et naviguez jusqu'à votre region AWS cible si nécessaire (US-west-2/Oregon).
   
    Vous verrez deux instances supplémentaires gérées par CloudEndure :
    - **CloudEndure Machine Converter** - utilisée pour la conversion du volume de boot source, pour rendre le volume bootable AWS, pour injecter les drivers de l'hyperviseur et installer les outils cloud. Elle s'exécute pendant quelques minutes lors de chaque Test ou Cutover.
    - **CloudEndure Replication Server** - utilisée pour recevoir les données cryptées des agents installés sur les environnements source. Elle s'exécute lorsque la réplication des données est en cours.

    Les deux types d'instances sont totalement gérés par CloudEndure et ne sont pas accessibles par les utilisateurs. 

    Dès que le Cutover est terminé, vous verrez une nouvelle instance EC2 dans la liste - c'est votre serveur web cible créé par CloudEndure. Notez ses adresses IP privées et publiques, vous en aurez besoin pour les étapes suivantes.

    {{% notice tip %}}
Si vous voulez en savoir plus à propos de ces serveurs, leur objectif et leurs prérequis réseau, regardez  <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">La Documentation CloudEndure</a>.
{{% /notice %}}
