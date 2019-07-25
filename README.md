説明書
======

# ファイル構成
```
+ .env # 忘れないように
+ README.md # これ
+ docker-compose.yml
+ nginx/
  + conf/
    + env # TZとか
    + nginx.conf
    + server.conf.template
+ php-fpm/
  + build/
      + Dockerfile
      + docker-entrypoint.sh
  + conf/
    + env # laravelに渡す環境変数とか？
    + php.ini
    + www.conf
+ src/
  + .keep
  + project/ # この中にlaravelソース展開する
```

# メモつらつら
## .envのCOMPOSE_PROJECT_NAMEはコンテナ名に使われます
```ini
        COMPOSE_PROJECT_NAME: project_name
```

## コンテナのowner問題回避
- ホストのuid/gidを渡しphp-fpmをその権限で実行するので、プロセスから作成されるファイルは実ユーザ
```shell
$ HOST_UID=$(id -u) HOST_GID=$(id -g) docker-compose up -d
```
## きちんとユーザ指定してコンテナ起動したら、php composerのキャッシュをホストと同期可能
- ホストの~/.composerとコンテナの~user/composerを繋いでcomposerをキャッシュも問題なくなる
```ini
  php-fpm:
    volumes:
      - ${HOME}/.composer:/home/user/.composer
```

## コマンド
```shell
$ docker-compose build --force
$ docker exec -it projectname_php-fpm_1 bash
$ docker images -f "dangling=true" -q | xargs --no-run-if-empty docker rmi
```

