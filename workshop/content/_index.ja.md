+++
title = "アプリケーション移行ハンズオン"
date = 2019-10-21T09:54:54+02:00
weight = 5
pre = "<b>0. </b>"
+++

本ハンズオンでは、BuyMyUnicorns という eコマースシステムのクラウド移行にチャレンジいただきます！
まずは、移行元（Source）と移行先の環境（Target）について、以下を確認してください。

## 移行元環境：Source

![source-env](/intro/source-env.png)

Source 環境は、２層で構成される eコマースの Web アプリケーションです。  
Apache、PHP、Wordpress、WooCommerce が稼働する Ubuntu ベースの Web サーバと、MySQL バージョン5.7 が稼働する Ubuntu ベースのデータベースサーバで、構成されています。

## 移行先環境：Target

![target-env](/intro/target-vpc.png)

Source 環境で稼働する eコマースシステムを AWS Cloud に移行します。
上の図は移行先のネットワークとなる VPC が、２つのアベイラビリティゾーンにまたがる６つのサブネットで構成されることを示しています。