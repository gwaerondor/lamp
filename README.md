# Lamp control with raspberry pi
This is a hackathon project that aims to automate control of a lamp's luminosity and colour depending on input of external stimuli such as weather, temperature, daily build status, state of emergency, health data, someone ringing your doorbell, CPU usage, or whatever you wish.

## Functionality
- Downloads weather data for Stockholm (city not configurable at the moment)
- Uses the weather data (temperature only for now) to generate a hexadecimal colour representation
- Connects the raspberry pi to a smart bulb
- Transmits the necessary bytes for changing the colour of the bulb at certain intervals

## Not done
- Cannot select location, only Stockholm is available at the moment.
- Cannot enter the bluetooth address of the bulb in use. This is hard-coded.
- Cannot enter the source of the data used to generate the colour. This is hard-coded.
- Cannot set the refresh interval. This is hard-coded.

## Limitations
This is a hackathon project and as such the functionality is very limited.
- Only a certain type of bulb is supported,
- The bluetooth setup that we used is expected and all other interfaces untested,
- Your machine may or may not have all necessary tools available to connect to the bulb over the bluetooth interface.

## Credits
Connecting bluetooth to a light bulb was slightly harder than expected and were it not for a few guides on the Internet, we would probably still be sitting there trying to figure it out.

Links to the resources we used will be added here in due time.