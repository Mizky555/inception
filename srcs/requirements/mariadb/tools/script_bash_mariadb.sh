#!/bin/bash

echo "Hello maria"
/etc/script_bash_mariadb.d/mariadb start

if [ -d "/var/lib/mysql/$MRDB_NAME" ]
then
	echo "Database exists"
else

mysql_secure_installation << EOF

Y
Y
$MRDB_ROOT
$MRDB_ROOT
Y
N
Y
Y
EOF

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MRDB_ROOT'; FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MRDB_NAME; GRANT ALL ON $MRDB_NAME.* TO '$MRDB_USER'@'%' IDENTIFIED BY '$MRDB_PASS'; FLUSH PRIVILEGES;" | mysql -uroot

fi

/etc/script_bash_mariadb.d/mariadb stop

exec "$@"
