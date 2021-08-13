+++
date = 2019-10-21T09:54:54+02:00
weight = 5
+++

<img style="position: sticky; top:0px; right: 0px" src="/intro/migrate-with-aws.png" alt="migrate with AWS" />

アマゾン ウェブ サービス (AWS) では、数百万以上のアクティブなお客様との経験と、
あらゆる年代、業種、地域の組織のクラウド移行を支援してきた経験に基づいて、
ワークロードをクラウドに移行するための標準的なプロセスを形成してきました。
このプロセスは、一般的に **1) 評価**、**2) モビライズ**、**3) 移行とモダナイゼーション**の3つのフェーズに分けることができます：

<a href="https://aws.amazon.com/cloud-migration/how-to-migrate/" target="_blank" rel="noopener noreferrer"><img src="/intro/migration-process.png"></a>

本ハンズオンでは、**移行とモダナイゼーション**のフェーズに焦点を当て、架空のアプリケーションを AWS クラウドに移行する方法を学びます：

  - <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer" >**AWS Database Migration Service**</a> を使ったデータベースの **Re-Platform**
  - <a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer" >**CloudEndure Migration**</a> を使った Web サーバーの **Re-Host**
  - <a href="https://aws.amazon.com/ecs/" target="_blank" rel="noopener noreferrer" >**Amazon Elastic Container Service**</a> で稼働するコンテナへの移行による、Web サーバーの**モダナイゼーション**
  - オプション：<a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer" >**AWS Well-Architected フレームワーク**</a>に沿った、アーキテクチャの**運用上の優秀性**、**セキュリティ**、**パフォーマンス効率**の向上と**コスト**の最適化