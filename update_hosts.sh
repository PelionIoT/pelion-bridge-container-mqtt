#!/bin/sh

update_hosts()
{
   IP_ADDRESS=`ifconfig | perl -nle'/dr:(\S+)/ && print $1' | tail -1`
   HOSTNAME=`hostname`
   echo "${IP_ADDRESS} ${HOSTNAME}" >> /etc/hosts
}

main()
{
   update_hosts
}

main $*
