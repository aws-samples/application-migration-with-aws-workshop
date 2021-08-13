+++
title = "Migração de Servidor"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### Visão geral do CloudEndure Migration

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> permite às organizações migrarem as cargas de trabalho mais complexas para Amazon Web Services (AWS) sem disrupção ou perda de dados. Através da replicação contínua de blocos, automação da conversão das máquinas e orquestração da aplicação, o **CloudEndure Migration** simplifica o processo de migração e reduz o potencial de erro humano.

Seja uma migração para AWS ou entre regiões dentro da AWS, o **CloudEndure Migration** lhe dá a flexibilidade necessária e entrega os controles de segurança requeridos para se ter sucesso.

![cloudendure-intro](/ce/ce-home.png)

**Os benefícios do CloudEndure Migration incluem:**

- Janelas de virada de minutos sem perda de dados
- 100% de integridade dos dados para todas as aplicações (incluindo databases e aplicações legado)
- Migrações de larga escala sem impacto de performance
- Amplo suporte a platformas e sistemas operacionais
- Migração automatizada para minimizar recursos de TI e duração do projeto

{{% notice note %}}
**CloudEndure Migration** está disponível **gratuitamente**  para todas as migrações para a AWS.  
Visite a <a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">página de registro do CloudEndure Migration</a> para criar uma conta e começar a migrar para a AWS em minutos!
{{% /notice %}}  

Aprenda mais sobre o **CloudEndure Migration** vendo o video abaixo.
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Neste lab você executará um re-hosting (também conhecido como "lift and shift migration") de um webserver seguindo os passos abaixo:

1. [Configuração do CloudEndure]({{< ref "CE-Configuration.pt.md" >}})  
2. [Instalação do Agente na máquina origem]({{< ref "CE-Agent-Installation.pt.md" >}})  
3. [Prepare o Blueprint]({{< ref "CE-Blueprints.pt.md" >}})  
4. [Faça um Cutover]({{< ref "CE-Cutover.pt.md" >}})  
5. [Configure uma aplicação]({{< ref "CE-Webserver-config.pt.md" >}})  
