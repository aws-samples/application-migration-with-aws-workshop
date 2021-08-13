+++
title = "Faça o Cutover (virada)"
weight = 40

+++
### CloudEndure Migration Teste e Cutover

Uma vez que você completou a replicação dos volumes (o status das máquinas deve estar em **Continuous Data Replication**), você pode executar o **Test/Cutover**.

Cada vez que um **Test/Cutover** é iniciado, o CloudEndure Migration deleta quaisquer instâncias criadas previamente e cria uma **new Target instance** atualizada com a última cópia dos dados do ambiente origem.

{{% notice note %}}
De acordo com as melhores práticas, você deve executar um **Test** pelo menos **uma semana** antes da data da migração. Isto ajudará a identificar potenciais desafios com a configuração do seu Blueprint ou com a conversão do volume replicado, tendo a chance de endereça-los.  
Neste lab, você executará um **Cutover** (esta conversão de instância já foi feita mais de 3.000 vezes, então nós sabemos que funciona!).
{{% /notice %}}


1. Confirme que os volumes estão replicados por completo
   
    Confirme que a instância está em um estado de **Continuous Data Replication** na coluna **DATA REPLICATION PROGRESS**.

    Caso ainda esteja replicando, espere até chegar no estado **Continuous Data Replication**. Enquanto espera, dê uma olha na <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">documentação do CloudEndure</a>.

2. Dispare o Cutover (virada)
   
    A partir da aba **Machines**, selecione o servidor que você deseja fazer o Cutover, clique o botão **LAUNCH 1 TARGET MACHINE** no canto superior direito da tela, então escolha **Cutover Mode** e **CONTINUE** no popup de confirmação.

    ![CE-Cutover](/ce/CE-Cutover.png)

    O CloudEndure executará um sincronismo e snapshot finaisnos volumes e começará o processo de construir novos servidores na infrastrutura destino, tudo isso acontece enquanto se mantém a consistência dos dados. Veja em **Job Progress** os detalhes.


    ![CE-job-progress](/ce/CE-job-progress.png)

    Monitore o **Job Progress** até ver a mensagem **Finished starting converters** (deve levar entre 3-5 minuteo). Neste meio tempo revise a <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">documentação do CloudEndure sobre detalhes no processo de cutover (virada)</a>.

    {{% notice tip %}}
Caso não veja sua virada no **Job Progress**, atualize o browser (F5) e certifique de escolhar o Job no topo da lista do CloudEndure jobs.
{{% /notice %}}

1. Revise os recursos criados pelo CloudEndure na sua conta AWS
   
    Vá para a **AWS Console** e navegue para a AWS region (US-west-2/Oregon).
   
    Você verá 2 instâncias adicionais gerenciadas pelo CloudEndure:
    - **CloudEndure Machine Converter** - usada para a conversão do boot volume, realizando mudanças no bootloader, injetando drivers de hipervisor e instalando ferramentas da nuvem. Ela rodará por alguns minutos a cada Test ou Cutover.
    - **CloudEndure Replication Server** - usado para receber dados criptografados dos agentes instalados no ambiente origem. Permanece rodando enquanto a replicação de dados acontece.

    Os dois tipos de instâncias são totalmente gerenciadas pelo CloudEndure e não estão acessíveis para os usuários.

    Assim que o cutover terminar, você verá outra instância EC2 na lista - é o seu Webserver destino criado pelo CloudEndure. Anote os IPs público e privado, você precisará deles no próximo passo.

    {{% notice tip %}}
Caso queira saber mais sobre as instâncias gerenciadas, seu propósito e requerimentos de rede veja a <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">documentação do CloudEndure</a>.
{{% /notice %}}
