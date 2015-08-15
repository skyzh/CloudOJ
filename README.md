# CloudOJ
New MVC Version of SNGOJ, built for CCCCWI.
Build based on INVO example of phalconphp

中国福利会少年宫的机智 OJ，这是一个试验版本 o(^▽^)o
然而我把它的名字叫做 CloudOJ， 听起来大概很有感觉。

## License

CloudOJ is under Apache License.

## Feedback

    echo sprintf("iSkyZH%s163.com", "@");
    echo sprintf("iSkyZH%sgmail.com", "@");

## Watcher

See [CloudOJWatcher](https://github.com/SkyZH/CloudOJWatcher) for Watcher

## Configure

0. git clone ...
1. Setup PHP and install [Phalcon](https://phalconphp.com)
2. Goto MySQL Database, excute [SQL Script](https://github.com/SkyZH/CloudOJ/blob/master/sql/cmd.sql), Then add oj user in database
3. Clone CloudOJ into \<apache htdocs\>/oj
4. Make config file at oj/app/config/config.ini
5. Edit database (For example, add Groups)
6. Start using OJ at localhost/oj, and then register a user
7. Goto MySQL Database, go to the user you registered in table user, change groupid to 1 to get admin premission


## Avatar

CloudOJ use the Gravator Service and use V2EX's Gravator CDN.

## Problem Data

To use data saved in file, put your file in /cloudojroot/ojdata/<file>.in and <file>.out,
then select type of File, type <file>.in in the dat_in textarea and <file>.out in the dat_out area.

We will filter '\r' in your input.

## Problem Data Cache

CloudOJ's Status Watcher will automatically cache data file. To refresh data, you can:

1. Goto /CloudOJWatcher/data/prob and `rm *`
2. Change the data's name after it is edited

## Group Table Example

Score Required: 0, 100, 2333333

Name: Naive, Beginner, Super

You must have a group whose score is 0, as well as a group whose score is LARGE ENOUGH.

## Config Example

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
    
    [crypt]
    key = 23333333333333


## Todo

* Problem Premission Web Interface
* Discuss System
* Contest System
* Change Password, Change Username
* Github OAuth Login
* Avatar System
