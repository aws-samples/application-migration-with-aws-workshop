+++
title = "Crear un Balanceador de Carga Elastico de AWS"
weight = 35
+++


Desde la **Consola de AWS**, selecciona **Servicios (Services)**, **EC2** y despues **Balanceadores de Carga (Load Balancers)**

Haz click en el boton **Crear Balanceador de Carga (Create Load Balancer)** y **Balanceador de Carga de Aplicaciones (Application Load Balancer)** como se indica abajo:

![create-loadbalancer](/ecs/create-lb.png)

En el paso **1.Configurar Balanceador de Carga (Configure Load Balancer)**, introduce el **Nombre (Name)** del balanceador de carga (por ejemplo unicorn-lb), escoge la VPC que quieras usar (ejemplo TargetVPC) y selecciona al menos dos subredes publicas (public-a, public-b) como se ve abajo:

![configure-loadbalancer](/ecs/configure-lb.png)

En el paso **3. Configurar Grupos de Seguridad (Configure Security Group)**, selecciona el grupo de seguridad LB-SG.

En el paso **4. Configurar Enrutado (Configure Routing)**, selecciona **Nuevo grupo objetivo (New target group)** en el  **Grupo Objetivo (Target group)** y proporciona un nombre para el grupo objetivo (ejemplo unicorn-tg). Para el **tipo de Objetivo (Target type)**, selecciona **IP**, deja los otros valores por defecto y haz click en **Siguiente: Registrar Objetivos (Next: Register Targets)**

![configure-routing](/ecs/configure-routing.png)

Deja los valores por defecto de registrar los objetivos , haz click en **Siguiente: Revisar (Next: Review)** y despues haz click en **Crear (Create)** para crear el balanceador de carga.
