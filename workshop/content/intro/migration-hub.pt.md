+++
title = "Habilitar o Migration Hub"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> provê um local único para acompanhar o progresso de migrações de aplicações a partir de várias soluções da AWS e de parceiros.

Para habilitá-lo, dentro da **AWS Console** vá para **Services -> AWS Migration Hub**, então no menu à esquerda cliquem em **Migrate** e selecione **US West Oregon** como sua home region.

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Então clique em **Migrate -> Tools** para escolher quais ferramentas proverão atualizações para o **AWS Migration Hub**. CloudEndure Migration já funciona nativamente, mas é necessário configurar a integração com **AWS Database Migration Service**.

Role até o fim da página e clique no botão **Connect** no **AWS Database Migration Service card**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

Em segundos, o estado da integração mudará de **Not connected** para **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

Pronto, todas as atividades futuras do **CloudEndure Migration** e **AWS Database Migration Service** serão reportadas no painel **AWS Migration Hub**.
