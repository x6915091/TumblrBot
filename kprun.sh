#salvare in /TeleSheep
#keeprunning.sh
#settare permessi sudo
#avviare processo con ./keeprunning.sh

finish()
{
    kill $(cat service.pid)
    exit
}

trap finish SIGINT

while :; do
    sudo ./launch.sh
    sleep 3
done