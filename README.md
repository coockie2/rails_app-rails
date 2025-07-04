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

* アセットファイルのコンパイル
```bash
docker compose run --rm web bin/rails assets:clobber
docker compose run --rm web bin/rails assets:precompile
```

* ルーティング確認
```
http://localhost:3000/rails/info/routes
```

* standardrbの実行
```bash
docker compose run --rm web rake standard:fix
docker compose run --rm web rake standard:fix_unsafely
```

* RSpecの実行
```bash
docker compose run --rm web rspec
docker compose run --rm web rspec spec/requests/tasks_controller_spec.rb
```


* CRUD機能実装
  * ref: https://qiita.com/shizen-shin/items/6cde2ccde5495ec16a6c

* Github CI Rspec
  * RailsプロジェクトにGitHub Actionsを導入する方法（Rspec, Rubocop）
    * ref: https://qiita.com/JZ8xNeXY/items/fef7efb5eb9495b62faf
