while true; do
	now=$(date)
    echo "Killed TumblrBot $now"
    kill -9 $(pgrep telegram-cli)
    sleep 2000
done
