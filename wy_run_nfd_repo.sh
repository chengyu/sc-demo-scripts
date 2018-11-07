ARG=$1
DIR=`pwd`
if [ $ARG == "start" ]; then
    timestamp=`date "+%Y-%m-%d-%H:%M:%S"`
    /usr/local/bin/nfd-start &>/tmp/nfd_$timestamp.log
    #sleep 3
    #nohup /usr/local/bin/nlsr -f $DIR/conf-files/wy/nlsr-wy.conf &
    #nohup /usr/local/bin/nlsr -f conf-files/wy/nlsr-wy.conf &
#   # /usr/local/bin/nfdstat_c -p /cmip5/den/ndnmap/stats -d 1 &
    #/usr/local/bin/nfdc set-strategy /catalog/genom /localhost/nfd/strategy/weighted-load-balancer

    #sleep 3
    ##/usr/local/bin/atmos-catalog -f $DIR/catalog-conf/genom-test.conf &
    ##/usr/local/bin/atmos-catalog -f catalog-conf/genom-test.conf &

    #nohup /usr/local/bin/ndn-repo-ng -c $DIR/conf-files/wy/repo-ng-a.conf &
    #nohup /usr/local/bin/ndn-repo-ng -c $DIR/conf-files/wy/repo-ng-b.conf &
    #nohup /usr/local/bin/ndn-repo-ng -c conf-files/wy/repo-ng-a.conf &
    #nohup /usr/local/bin/ndn-repo-ng -c conf-files/wy/repo-ng-b.conf &
fi

if [ $ARG == "stop" ]; then
    /usr/local/bin/nfd-stop
fi
