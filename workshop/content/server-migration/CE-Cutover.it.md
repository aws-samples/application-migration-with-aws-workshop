+++
title = "Esegui il  Cutover"
weight = 40

+++
### CloudEndure Migration Test/Cutover

Una volta completata la replica dei volumi (quindi lo stato accanto al nome della macchina indica **Continuous Data Replication**), è quindi possibile eseguire un **Test/Cutover**.

Ogni volta che si avvia il  **Test/Cutover**, CloudEndure Migration elimina tutte le istanze precedentemente create e crea una **new Target instance** aggiornata con l'ultima copia dei dati dall'ambiente di origine.

{{% notice note %}}
Secondo le migliori pratiche e nella vita reale, è necessario eseguire una migrazione **Test** almeno  **una settimana** prima della data di migrazione. Questo serve a identificare potenziali sfide con la tua configurazione Blueprint o con la conversione del volume replicata e risolverle.  
In questo laboratorio, eseguirai un **Cutover** (questa conversione di istanza è stata eseguita quasi 3.000 volte, quindi sappiamo che funziona!).
{{% /notice %}}


1. Verificare che i volumi siano completamente replicati
   
    Confermare che l'istanza sia in uno stato di  **Continuous Data Replication** sotto la colonna **DATA REPLICATION PROGRESS** .

    Se si sta ancora replicando, attendere fino a raggiungere lo stato di **Continuous Data Replication** . Durante l'attesa è possibile rivedere la <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">documentazione CloudEndure</a>.

2. Il Trigger del Cutover
   
    Dalla lista delle  **Macchine** selezionare il server su cui si desidera eseguire il Cutover, seleziona il bottone **LAUNCH 1 TARGET MACHINE** nell'angolo in alto a destra dello schermo, quindi **Cutover Mode** e **CONTINUE** nel popup di conferma.

    ![CE-Cutover](/ce/CE-Cutover.png)

   CloudEndure eseguirà ora una sincronizzazione / istantanea finale sui volumi e inizierà il processo di creazione di nuovi server nell'infrastruttura di destinazione, il tutto mantenendo la coerenza dei dati. Vedere la schermata **Job Progress** per i dettagli.


    ![CE-job-progress](/ce/CE-job-progress.png)

    Monitorare il registro  **Job Progress** fino a quando non viene visualizzato il messaggio **Finished starting converters**  (dovrebbero essere necessari 3-5 minuti). Nel frattempo puoi rivedere la <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">Documentazione di CloudEndure che fornisce dettagli sul processo di cutover</a>.

    {{% notice tip %}}
Se non vedi il tuo lavoro nella finestra **Job Progress**, aggiorna il browser (F5) e assicurati di scorrere fino all'inizio dell'elenco a discesa dei lavori CloudEndure.
{{% /notice %}}

1. Controlla le risorse create da CloudEndure nel tuo account AWS
   
    Torna alla **Console AWS** e, se necessario, naviga verso la tua regione AWS di destinazione (US-ovest-2 / Oregon).
   
    Vedrai due istanze aggiuntive gestite da CloudEndure:
    - **CloudEndure Machine Converter** - utilizzato per la conversione del volume di avvio di origine, apportando modifiche al bootloader specifico di AWS, iniettando driver hypervisor e installando strumenti cloud. È in esecuzione per un paio di minuti per ogni test o ritaglio.
    - **CloudEndure Replication Server** - utilizzato per ricevere dati crittografati dagli agenti installati nell'ambiente di origine. È in esecuzione quando è in corso la replica dei dati.

    Entrambi i tipi di istanze sono completamente gestiti da CloudEndure e NON sono accessibili agli utenti.

     Al termine del Cutover, verrà visualizzata un'altra istanza EC2 nell'elenco: questo è il server Web di destinazione creato da CloudEndure. Prendi nota dei suoi IP pubblici e privati, poiché ti serviranno nel prossimo passaggio.

    {{% notice tip %}}
Se vuoi saperne di più su quei server, vedi il loro scopo e i requisiti di rete nella <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">Documentazione di CloudEndure</a>.
{{% /notice %}}
