# CloudOJ
New MVC Version of SNGOJ, built for CCCCWI.
Build based on INVO example of phalconphp

中国福利会少年宫的机智 OJ，这是一个试验版本 o(^▽^)o
然而我把它的名字叫做 CloudOJ， 听起来大概很有感觉。

## License

CloudOJ is under Apache License.

## Watcher

See [CloudOJWatcher](https://github.com/SkyZH/CloudOJWatcher) for Watcher

## Configure

1. Setup PHP and install [Phalcon](https://phalconphp.com)
2. Goto MySQL Database, excute [SQL Script](https://github.com/SkyZH/CloudOJ/blob/master/sql/cmd.sql), Then add sql oj user
3. Clone CloudOJ to htdocs/oj
4. Make config file at oj/app/config/config.ini
5. Start using OJ at localhost/oj, and register a user
6. Goto MySQL Database, go to the user you registered in table user, change groupid to 1 to get admin premission

## Config Sample
```
[database]
adapter  = Mysql
host     = localhost
username = ojroot
password = abcdefghijklmnopqrstuvwxyz
name     = oj

[application]
controllersDir = app/controllers/
modelsDir      = app/models/
viewsDir       = app/views/
pluginsDir     = app/plugins/
formsDir       = app/forms/
libraryDir     = app/library/
baseUri        = /oj/

[watcher]
apikey = abcdefghijklmnopqrstuvwxyz
```
