ARG=$1
if [ $ARG == "start" ]; then
    timestamp=`date "+%Y-%m-%d-%H:%M:%S"`
    /usr/local/bin/nfd-start &>/tmp/nfd_$timestamp.log
#    sleep 3
#    /usr/local/bin/nfdstat_c -p /cmip5/den/ndnmap/stats -d 1 &
#    # using nlsr
    /usr/local/bin/nfdc set-strategy /catalog/genom /localhost/nfd/strategy/weighted-load-balancer

    sleep 3
    /usr/local/bin/atmos-catalog -f catalog-conf/genom-test.conf &

    nohup /usr/local/bin/ndn-repo-ng &
fi

if [ $ARG == "stop" ]; then
    /usr/local/bin/nfd-stop
fi
