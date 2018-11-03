arm PELION Device Shadow bridge for generic MQTT brokers              
  
11/03/2018: updated bridge - new IoTHub HTTP-based implementation (optional) in leu of MQTT

10/30/2018: updated bridge - minor fix to iobhub auth header for pelion webhook.

10/29/2018: updated bridge - updated Pelion webhook validator and setup mechanism. Health stat tuning. 

10/27/2018: updated bridge - Google CloudIoT corner-case fix for hard-restarted bridge

10/26/2018: updated bridge - IoTHub device prefixing now defaulted to enabled

10/26/2018: updated bridge - device shadow deletion message cleanups, misc configuration tweaks

10/20/2018: updated bridge - misc cleanups

10/16/2018: updated bridge and properties editor

10/10/2018: updated bridge and properties editor - numerous http retry fixes and enhancements

10/10/2018: updated bridge - IoTHub token expiration fix

10/09/2018: updated bridge - MQTT fixes, HTTP fixes, device discvoery fixes and tweaks, IoTHub fixes, Max # shadows

10/07/2018: updated bridge - lots of fixes for device deletion

10/06/2018: updated bridge - lots of debugging cleanups, iothub fixes

10/05/2018: updated bridge - pagination support added for Pelion and initial scaling tests and fixes

10/03/2018: updated bridge and properties editor - general sync

10/02/2018: updated bridge - fixed shadow count accounting

10/01/2018: updated bridge - updated specific health stat updates

Container Bridge Instance Installation:

1). Clone this repo into a Linux instance that supports docker

2). cd into the cloned repo and run: ./run-reload-bridge.sh

3). Next go to https://os.mbed.com and create your mbed Account. You can then request a Pelion developer account using the same credentials at https://portal.us-east-1.mbedcloud.com

4). Once your Pelion account is created, you need to "Access Keys" to create a Pelion API Key/Token. Record the Token Value

Now that you have your:

    - MQTT Broker IP Address 

    - Pelion API Key/Token generated

Go to:  https://[[your containers public IP address]]:8234

    - username: "admin" (no quotes)

    - password: "admin" (no quotes)

Enter your MQTT Broker IP address and Pelion API Token

    - Please press "SAVE" after *each* is entered... 

    - After all are entered and saved, press "RESTART"

Your Generic MQTT bridge should now be configured and operational. 

NOTE: for the test scripts, I've had issues with paho-mqtt v1.2. Try v1.1... seems to work better.

Bridge source (Apache 2.0 licensed - Enjoy!): https://github.com/ARMmbed/pelion-bridge.git

Copyright 2018. ARM Ltd. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 
