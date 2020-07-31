+++
title = "Erstellen Sie einen Amazon ECS Cluster"
weight = 40
+++


### Erstellen Sie einen **Amazon ECS (Elastic Container Service)** Cluster

Bei **AWS console**, besuchen Sie **Services**, und wählen Sie **ECS** aus
und dann klicken Sie auf die Schaltfläche **Create Cluster** darauf.

Wählen Sie **Networking only** als die Cluster-Vorlage (cluster template) 
und klicken Sie auf die Schaltfläche **Next step** darauf.

![create-cluster](/ecs/create-cluster.png)

Geben Sie bei Cluster-Konfiguration einen Namen des Clusters ein (z. B. Einhörner-Cluster) 
und aktivieren Sie das Kontrollkästchen **Container Insights aktivieren**, 
um die **CloudWach-Container-Insights** für detailliertere Metriken zu aktivieren, 
die über **Amazon CloudWatch** bereitgestellt werden.

![configure-cluster](/ecs/configure-cluster.png)

Klicken Sie abschließend auf die Schaltfläche **Create** darauf, 
um den Amazon ECS-Cluster zu erstellen.
