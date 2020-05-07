#version 120

varying vec4 texcoord;
varying vec3 sunlight;
uniform int worldTime;
uniform float rainStrength;

	float timefract = worldTime;

	float TimeSunrise  = ((clamp(timefract, 23000.0, 24000.0) - 23000.0) / 1000.0) + (1.0 - (clamp(timefract, 0.0, 4000.0)/4000.0));
	float TimeNoon     = ((clamp(timefract, 0.0, 4000.0)) / 4000.0) - ((clamp(timefract, 8000.0, 12000.0) - 8000.0) / 4000.0);
	float TimeSunset   = ((clamp(timefract, 8000.0, 12000.0) - 8000.0) / 4000.0) - ((clamp(timefract, 12000.0, 12750.0) - 12000.0) / 750.0);
	float TimeMidnight = ((clamp(timefract, 12000.0, 12750.0) - 12000.0) / 750.0) - ((clamp(timefract, 23000.0, 24000.0) - 23000.0) / 1000.0);
	
void main() {
	gl_Position = ftransform();
	
	vec3 sunrise_sun;
	 sunrise_sun.r = 1.0 * TimeSunrise;
	 sunrise_sun.g = 0.629 * TimeSunrise;
	 sunrise_sun.b = 0.416 * TimeSunrise;
	
	vec3 noon_sun;
	 noon_sun.r = 1.0 * TimeNoon;
	 noon_sun.g = 0.8 * TimeNoon;
	 noon_sun.b = 0.7 * TimeNoon;
	
	vec3 sunset_sun;
	 sunset_sun.r = 0.99 * TimeSunset;
	 sunset_sun.g = 0.629 * TimeSunset;
	 sunset_sun.b = 0.416 * TimeSunset;
	
	vec3 midnight_sun;
	 midnight_sun.r = 0.45 * TimeMidnight * 0.20f;
	 midnight_sun.g = 0.70 * TimeMidnight * 0.20f;
	 midnight_sun.b = 1.00 * TimeMidnight * 0.20f;
	 
	vec3 rain_sun_day;
	 rain_sun_day.r = 1.0f * (1.0f - TimeMidnight) * 0.1f; 
	 rain_sun_day.g = 1.0f * (1.0f - TimeMidnight) * 0.1f;
	 rain_sun_day.b = 1.0f * (1.0f - TimeMidnight) * 0.1f;	
	 
	vec3 rain_sun_night;
	 rain_sun_night.r = 1.0f * (TimeMidnight) * 0.0f;
	 rain_sun_night.g = 1.0f * (TimeMidnight) * 0.0f;
	 rain_sun_night.b = 1.0f * (TimeMidnight) * 0.0f;
	
	 sunlight = mix(sunrise_sun + noon_sun + sunset_sun + midnight_sun, rain_sun_day + rain_sun_night, rainStrength);
	 
	texcoord = gl_MultiTexCoord0;
}
