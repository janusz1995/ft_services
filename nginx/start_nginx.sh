mkdir /run/nginx/
rc default
/etc/init.d/sshd start
nginx -g 'daemon off;'
