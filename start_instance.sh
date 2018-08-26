#!/bin/bash

update_hosts()
{
    sudo /home/arm/update_hosts.sh
    rm /home/arm/update_hosts.sh
}

run_supervisord()
{
   /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf 2>&1 1>/tmp/supervisord.log
}

run_pelion_bridge()
{
   cd /home/arm
   su -l arm -s /bin/bash -c "/home/arm/restart.sh &"
}

run_properties_editor()
{
  cd /home/arm/properties-editor
  su -l arm -s /bin/bash -c "/home/arm/properties-editor/runPropertiesEditor.sh 2>&1 1> /tmp/properties-editor.log &"
}

enable_long_polling() {
   LONG_POLL="$2"
   if [ "${LONG_POLL}" = "use-long-polling" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mds_enable_long_poll=false/mds_enable_long_poll=true/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.poll
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_mdc_api_token() {
   API_TOKEN="$2"
   if [ "$2" = "use-long-polling" ]; then
        API_TOKEN="$3"
   fi
   if [ "${API_TOKEN}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/Pelion_API_Key_Goes_Here/${API_TOKEN}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mdc_api_token
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_mqtt_broker_address() {
   ADDRESS="$3"
   if [ "$2" = "use-long-polling" ]; then
        ADDRESS="$4"
   fi
   if [ "${ADDRESS}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/Your_MQTT_broker_IP_address_Goes_Here/${ADDRESS}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mqtt_broker_address
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_mqtt_username() {
   USERNAME="$4"
   if [ "$2" = "use-long-polling" ]; then
        USERNAME="$5"
   fi
   if [ "${USERNAME}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mqtt_username=off/mqtt_username=${USERNAME}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mqtt_username
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}  

set_mqtt_password() {
   PASSWORD="$5"
   if [ "$2" = "use-long-polling" ]; then
        PASSWORD="$6"
   fi
   if [ "${PASSWORD}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mqtt_password=off/mqtt_password=${PASSWORD}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mqtt_password
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
} 

set_mqtt_clientid() {
   CLIENTID="$6"
   if [ "$2" = "use-long-polling" ]; then
        CLIENTID="$7"
   fi
   if [ "${CLIENTID}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mqtt_client_id=off/mqtt_client_id=${CLIENTID}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mqtt_client_id
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}  

set_mqtt_port() {
   PORT="$7"
   if [ "$2" = "use-long-polling" ]; then
        PORT="$8"
   fi
   if [ "${PORT}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mqtt_port=1883/mqtt_port=${PORT}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mqtt_port
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}  

set_perms() {
  cd /home/arm
  chown -R arm.arm .
}

main() 
{
   update_hosts
   enable_long_polling $*
   set_mdc_api_token $*
   set_mqtt_broker_address $*
   set_mqtt_username $*
   set_mqtt_password $*
   set_mqtt_clientid $*
   set_mqtt_port $*
   set_perms $*
   run_properties_editor
   run_pelion_bridge
   run_supervisord
}

main $*
