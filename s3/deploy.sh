#!/bin/bash -eux

# 各種設定ファイルのコピー
sudo cp -f env.sh /home/isucon/env.sh
#sudo cp -f etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#sudo cp -f etc/nginx/nginx.conf /etc/nginx/nginx.conf
#sudo cp -f etc/nginx/sites-available/isucondition.conf /etc/nginx/sites-available/isucondition.conf
#sudo nginx -t

# アプリケーションのビルド
#cd /home/isucon/webapp/go
#make

# ミドルウェア・Appの再起動
#sudo systemctl restart mariadb
#sudo systemctl reload nginx
#sudo systemctl restart isuxxxx

# slow query logの有効化
QUERY="
set global slow_query_log_file = '/var/log/mysql/mysql-slow.log';
set global long_query_time = 0;
set global slow_query_log = ON;
"
echo $QUERY | sudo mysql -uroot

# log permission
sudo chmod -R 777 /var/log/nginx
sudo chmod -R 777 /var/log/mysql
