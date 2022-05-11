# sqlserver on docker-compose

## 特徴

- sqlserver 2019
- rubyからアクセス可能

## 起動・終了

- 起動

```sh
docker-compose up -d
```

- linux&2019の場合は `sudo chmod 777 mssql` が必要

- テスト

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd" -Q "select name from sys.databases;"
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

## バックアップ・リストア

- [microsoftの解説](https://docs.microsoft.com/ja-jp/sql/linux/sql-server-linux-backup-and-restore-database?view=sql-server-ver15)

- バックアップ

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd" -Q "BACKUP DATABASE [TestDB] TO DISK = N'/var/opt/mssql/data/testdb.bak' WITH NOFORMAT, NOINIT, NAME = 'testdb-full', SKIP, NOREWIND, NOUNLOAD, STATS = 10"
```

- リストア

```sh
docker-compose exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "P@ssw0rd" -Q "RESTORE DATABASE [TestDB] FROM DISK = N'/var/opt/mssql/data/testdb.bak' WITH FILE = 1, NOUNLOAD, REPLACE, STATS = 5"
```
