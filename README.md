# cakephp-dev-env-docker

CakePHPの開発環境のサンプルです。

- [Docker Hub - spiktikn/cakephp-dev-env](https://hub.docker.com/r/spiktikn/cakephp-dev-env)

バージョンは以下のようにしていますが、適宜変更してください。
|                | バージョン        |
| :------------- | :---------------- |
| ベースイメージ | php:7.3.30-buster |
| Composer       | 1.10.20           |

DBは、PostgreSQLを想定しているため、`postgresql-client-11`をインストールしていますが、この部分も必要であればMySQLなどのクライアントに変更してください。

`docker run`コマンドやbindマウントの設定、DBコンテナは省略します。

そのうち、DBコンテナ用のDockerfileや開発コンテナの設定は追加するかもしれません。

## ビルド

```shell
docker build -t cakephp-dev-env .
```
