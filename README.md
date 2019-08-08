### 起動方法
1. 環境変数の設定
`cp .envrc.sample .envrc` をして各自設定してください。

.envrcファイル
```envrc:.envrc
DATABASE_USERNAME=root
DATABASE_PASSWORD=password
DATABASE_HOST=mysql
```

2. ビルドする
```
$ docker-compose build
$ docker-compose up -d
```

3. DBセットアップ
```
$ docker-compose run --rm web rake db:create
$ docker-compose run --rm web rake db:migrate
```
