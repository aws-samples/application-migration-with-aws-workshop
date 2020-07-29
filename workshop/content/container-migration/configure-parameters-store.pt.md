+++
title = "Configure o Parameter Store"
weight = 30
+++

Como você usará a docker image oficial do wordpress com o RDS database, será necessário prover as credenciais do banco de dados, o nome do banco de dados e detalhes de configuração do servidor wordpress. 

A melhor e mais segura maneira de fazer isso é usando o **AWS Systems Manager** Parameter Store ao invés de armazenar estes detalhes na docker image ou no ECS Task Definition.

Na **AWS Console**, selecione **Services**, então **Systems Manger** e vá para **Parameter Store**.

Clique no botão **Create parameter** e entre os **Parameter Details** (Nome, Descrição, Tipo e Valor) para os parâmetros como na tabela abaixo.

![parameter-details](/ecs/parameter-details.png)

Repita os passos acima para todos os parâmetros:


| Parameter              | Type             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | nome do banco de dados destino (wordpress-db)  |
| DB_USERNAME            | String           | username do RDS database           |
| DB_PASSWORD            | SecureString     | senha do RDS database           |
