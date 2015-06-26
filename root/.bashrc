if [ ! -d /www/log ]; then
	mkdir /www/log -p && chown www-data:www-data /www/log
fi
ssup=$(ps aux | grep supervisord | grep -v grep | wc -l)
if [ $ssup -lt 1 ]; then
    supervisord  -c /etc/supervisord.conf
fi
alias ll='ls -l'
