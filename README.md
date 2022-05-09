# sqlserver on docker-compose

## 特徴

- sqlserver 2019
- rubyからアクセス可能

## 起動・終了

- 起動

```sh
docker-compose up -d
```

- テスト

```sql
select name from sys.databases;
go
```

- sqlコマンド

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd"
```

- データ作成

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd" -i create.sql
```

- データ参照

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd" -i select.sql
```

- rubyからデータ参照

```sh
docker-compose exec cli ruby select.rb
```

- 終了

```sh
docker-compose down -v --remove-orphans
```
