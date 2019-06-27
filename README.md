arm PELION Device Shadow bridge for generic MQTT brokers              
  
06/27/2019: updated preferences editor

06/26/2019: updated bridge - more tweaking of WS logger tunables

06/24/2019: updated bridge - tweaked WS logger tunables...

06/21/2019: updated bridge and properties editor - dependency lib updates

06/19/2019: updated properties editor

06/18/2019: updated bridge - added short pause to long polling to prevent runaway polling...

04/17/2019: updated bridge - updated dependency components

04/12/2019: Google CloudIoT fixes, updated GoogleCloudIoT APIs

03/07/2019: refresh builds

01/05/2019: docker build trigger update

01/04/2019: Happy New Year! minor update to mbed-properties-editor

11/26/2018: updated bridge - removed outdated scripts - no longer needed

11/07/2018: updated bridge - new Google CloudIoT HTTP-based implementation (optional) in leu of MQTT

11/04/2018: updated bridge - reoganized for future AWS and Google HTTP implementations

11/03/2018: updated bridge - new IoTHub HTTP-based implementation (optional) in leu of MQTT

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
