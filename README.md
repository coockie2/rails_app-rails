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
