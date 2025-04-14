# 環境構築
## docker
https://zenn.dev/tmasuyama1114/articles/rails-docker-5x-how-to

### DB環境構築
```bash
docker compose run --rm web bin/rails db:drop db:create db:migrate
```

```bash
docker compose run --rm web bin/rails c
```

* ルーティング確認
```
http://localhost:3000/rails/info/routes
```

* RSpecの実行
```bash
docker compose run --rm web rspec
docker compose run --rm web rspec spec/requests/tasks_controller_spec.rb
```


### CRUD機能実装
ref: https://qiita.com/shizen-shin/items/6cde2ccde5495ec16a6c
