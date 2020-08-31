arm PELION Device Shadow bridge for generic MQTT brokers              
  
08/31/2020: updated bridge - updated dependencies

02/29/2020: updated bridge - fixes for draft mode MQTT (token handling) 

02/29/2020: updated bridge - updated for treasuredata support. minor marshalling fixes

02/25/2020: updated bridge - updated internal dependencies. bridge updates (Watson)

02/24/2020: updated bridge - final fixes for draft mode mqtt formatting

02/24/2020: updated bridge - resync with dockerhub

01/22/2020: updated bridge - reverted broken jetty websocket dependency updates

01/17/2020: updated bridge - internal dependencies updated

11/11/2019: updated bridge - internal dependencies updated

10/31/2019: updated bridge - minor udpates and fixes

08/29/2019: updated bridge - minor fixes/enhancements

08/23/2019: updated bridge - minor update for mqtt

08/20/2019: updated bridge - added key Pelion device attribute retrieval prior to twin creation

08/13/2019: updated bridge - webhook fixes

08/12/2019: updated bridge - numerous bugfixes and initial websocket notification callback support

07/25/2019: updated bridge - additional fixes and updates

07/23/2019: updated bridge - PUT content type fixes, TypeDecoder and GC enhancements

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
