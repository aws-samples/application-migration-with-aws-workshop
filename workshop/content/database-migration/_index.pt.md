+++
title = "Migração de Banco de Dados "
weight = 10
pre = "<b>1. </b>"
+++

Nesta seção você executará a migração de banco de dados usando o banco de dados origem MySQL para um banco de dados destino Amazon RDS for MySQL com o **AWS Database Migration Service**. Como essa é uma migração homogênea de banco de dados (a origem e o destino tem o mesmo database engines) - o esquema, tipos de dados e o código do banco de dados são compatíveis entre os bancos origem e destino, isso significa que não será necessário uma conversão do esquema do banco de dados.

![1](/db-mig/DMS-overview.png)

Aprenda mais sobre este serviço vendo o video abaixo.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Neste lab, você executará o seguintes passos:

1. [Criar um banco de dados destino]({{< ref "Create-target-DB.pt.md" >}})

2. [Configurar a rede]({{< ref "setup_network.pt.md" >}})

2. [Criar uma Replication Instance]({{< ref "Create-Replication-instance.pt.md" >}})

3. [Criar Endpoints origem e destino]({{< ref "Create-Source-and-Target-endpoints.pt.md" >}})

4. [Configurar um banco de dados origem]({{< ref "configure_source_database.pt.md" >}})

4. [Criar e rodar uma Replication Task]({{< ref "Create-and-run-Replication-task.pt.md" >}})

5. [Resumo]({{< ref "Summary.pt.md" >}})
