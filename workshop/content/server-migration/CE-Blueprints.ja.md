+++
title = "Blueprint の準備"
weight = 30
+++

インスタンスがレプリケートされている間に、AWS で起動するターゲットマシン（レプリケートされたインスタンス）のスペックとなる CloudEndure Target Machine Blueprint を設定しましょう。Blueprint にはマシンのタイプ（例：t3.medium）や、マシンが稼働するサブネット、プライベート IP アドレス、ディスクの種類などのパラメータが含まれています。

Blueprint を設定するには、左のメニューから **Machines** に移動し、設定したいマシンの名前をクリックします。
ページが表示されたら、**BLUEPRINT** のセクションに移動します。

![CE-BluePrints](/ce/CE-BluePrints.png)

以下のパラメータを使用して、Blueprint の設定を行います：

| パラメータ                                  | 入力値                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | タグを追加（Key : 'Name' Value : 'Webserver'） |

上記以外のパラメータは、すべてデフォルトのままにしますが、ターゲットマシンで利用可能な設定やオプションを理解するために、一通り確認を行ってください。

{{% notice warning %}}
本ハンズオンを AWS 主催のイベントで実施している場合は、***.large** よりもサイズの大きいマシンタイプを選択しないでください。
割り当てられている IAM 権限の関係上、後の手順で作成されるインスタンスの操作ができなくなります。
{{% /notice %}}


{{% notice tip %}}
BLUEPRINT のセクションでフィールドが表示されない場合や、フィールドのスクロールが難しい場合は、画面を縮小してください（Control -）。
{{% /notice %}}

完了したら、ページ下部の **SAVE BLUEPRINT** ボタンをクリックします。

Blueprint の保存時に、**"The default security group includes ports 80, 443, 22 and 3389 open."** という、セキュリティ警告が表示されますが、これはマシンに割り当てるセキュリティグループを、CloudEndure で自動生成する場合に表示されるものです。  

今回はハンズオンのため、この警告を無視して次のセクションに進みますが、
本番環境のワークロードを移行する場合は、必要な通信のみを許可したセキュリティグループを事前に作成して、Blueprint に設定してください。