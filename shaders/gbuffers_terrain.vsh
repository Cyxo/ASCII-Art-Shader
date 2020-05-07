#version 120

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;


attribute vec4 mc_Entity;

uniform int worldTime;
uniform float rainStrength;


#define WAVING_GRASS
#define WAVING_WHEAT
#define WAVING_LEAVES
#define WAVING_FIRE
#define WAVING_FLOWERS
#define WAVING_LILIES
#define WAVING_LAVA
#define WAVING_VINES

void main() {

	texcoord = gl_MultiTexCoord0;
	
	vec4 position = gl_Vertex;
	

#ifdef WAVING_GRASS	
//Grass//
	if (mc_Entity.x == 31.0 && texcoord.t < 0.15) {
		float speed = 8.0;
		
		float magnitude = sin((worldTime * 3.14159265358979323846264 / (28.0)) + position.x + position.z) * 0.1 + 0.1;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.z;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.x;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.x;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.z;
		position.x += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.x + d0) * 0.1 + (position.z + d1) * 0.1) * magnitude * (1.0f + rainStrength * 1.4f);
		position.z += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.z + d2) * 0.1 + (position.x + d3) * 0.1) * magnitude * (1.0f + rainStrength * 1.4f);

		
	}
	
	
	
	//small leaf movement
	if (mc_Entity.x == 31.0 && texcoord.t < 0.15) {
		float speed = 0.8;
		
		float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((28.0)))) * 0.05 + 0.15) * 0.4;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude * (1.0f + rainStrength * 1.7f);
		position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude * (1.0f + rainStrength * 1.7f);
		position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/3.0) * (1.0f + rainStrength * 1.7f);
	}
	
#endif	


#ifdef WAVING_GRASS	
//Grass//
	if (mc_Entity.x == 111.0) {
		float speed = 8.0;
		
		float magnitude = sin((worldTime * 3.14159265358979323846264 / (28.0)) + position.x + position.z) * 0.1 + 0.1;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.z;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.x;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.x;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.z;
		position.x += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.x + d0) * 0.1 + (position.z + d1) * 0.1) * magnitude;
		position.z += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.z + d2) * 0.1 + (position.x + d3) * 0.1) * magnitude;
		
		
	}
	
	
	//small leaf movement
	if (mc_Entity.x == 111.0) {
		float speed = 0.8;
		
		float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((28.0)))) * 0.05 + 0.15) * 0.4;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude;
		position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude;
		position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/3.0);
	}
	
#endif


#ifdef WAVING_WHEAT
//Wheat//
	if (mc_Entity.x == 59.0 && texcoord.t < 0.35) {
		float speed = 8.0;
		
		float magnitude = sin((worldTime * 3.14159265358979323846264 / (28.0)) + position.x + position.z) * 0.02 + 0.02;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.z;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.x;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.x;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.z;
		position.x += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.x + d0) * 0.1 + (position.z + d1) * 0.1) * magnitude;
		position.z += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.z + d2) * 0.1 + (position.x + d3) * 0.1) * magnitude;
	}
	
	//small leaf movement
	if (mc_Entity.x == 59.0 && texcoord.t < 0.35) {
		float speed = 0.8;
		
		float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((28.0)))) * 0.025 + 0.075) * 0.2;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude * (1.0f + rainStrength * 2.0f);
		position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude * (1.0f + rainStrength * 2.0f);
		position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/3.0) * (1.0f + rainStrength * 2.0f);
	}
	
#endif
	
	

#ifdef WAVING_LEAVES
//Leaves//



	
		
	if (mc_Entity.x == 18.0 && texcoord.t < 1.90 && texcoord.t > -1.0) {
		float speed = 1.0;
		
		float magnitude = (sin((position.y + position.x + worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.15 + 0.15) * 0.20;
		float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
		float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
		float d2 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
		float d3 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5;
		position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude * (1.0f + rainStrength * 1.0f);
		position.z += sin((worldTime * 3.14159265358979323846264 / (17.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude * (1.0f + rainStrength * 1.0f);
		position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/2.0) * (1.0f + rainStrength * 1.0f);
		
	}
	
#endif	


#ifdef WAVING_FIRE
//Fire//
	if (mc_Entity.x == 51.0 && texcoord.t < 0.10) {
		float magnitude = 0.3;
		float d0 = sin(worldTime * 3.14159265358979323846264 / 22.0) * 1.0 + 1.5 + position.z;
		float d1 = sin(worldTime * 3.14159265358979323846264 / 52.0) * 1.0 + 1.5 + position.x;
		float d2 = sin(worldTime * 3.14159265358979323846264 / 92.0) * 1.0 + 1.5 + position.z;
		float d3 = sin(worldTime * 3.14159265358979323846264 / 92.0) * 1.0 + 1.5 + position.x;
		position.x += sin((worldTime * 3.14159265358979323846264 / 16.0) + (position.x + d0) * 1.0 + (position.z + d1) * 2.0) * magnitude;
		position.z += sin((worldTime * 3.14159265358979323846264 / 18.0) + (position.z + d2) * 2.0 + (position.x + d3) * 1.0) * magnitude;
		position.y += sin((worldTime * 3.14159265358979323846264 / 8.5) + (position.z + d2) * 3.0 + (position.x + d3) * 2.0) * magnitude;
	}
#endif


#ifdef WAVING_FLOWERS
    //large scale movement (dandelions)
    if (mc_Entity.x == 37.0 && texcoord.t < 0.01) {
        float speed = 8.0;
        float magnitude = sin((worldTime * 3.14159265358979323846264 / (28.0)) + position.x + position.z) * 0.1 + 0.1;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.z;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.x;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.x;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.z;
        position.x += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.x + d0) * 0.1 + (position.z + d1) * 0.1) * magnitude;
        position.z += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.z + d2) * 0.1 + (position.x + d3) * 0.1) * magnitude;

    }
    //small scale movement (dandelions)
    if (mc_Entity.x == 37.0 && texcoord.t < 0.01) {
        float speed = 0.8;
        float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((28.0)))) * 0.05 + 0.15) * 0.4;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude;
        position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/3.0);
    }
    //large scale movement (roses)
    if (mc_Entity.x == 38.0 && texcoord.t < 0.01) {
        float speed = 8.0;
        float magnitude = sin((worldTime * 3.14159265358979323846264 / (28.0)) + position.x + position.z) * 0.1 + 0.1;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.z;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.x;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5 + position.x;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5 + position.z;
        position.x += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.x + d0) * 0.1 + (position.z + d1) * 0.1) * magnitude;
        position.z += sin((worldTime * 3.14159265358979323846264 / (28.0 * speed)) + (position.z + d2) * 0.1 + (position.x + d3) * 0.1) * magnitude;

    }
    //small scale movement (roses)
    if (mc_Entity.x == 38.0 && texcoord.t < 0.01) {
        float speed = 0.8;
        float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((28.0)))) * 0.05 + 0.15) * 0.4;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude;
        position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/3.0);
    }
#endif


#ifdef WAVING_LILIES
    //flowing water
    if (mc_Entity.x == 111.0 && texcoord.t > 0.05) {
        float speed = 2.7;
        float magnitude = (sin((worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.05 + 0.15) * 0.17;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (13.0 * speed)) + (position.x + d0)*0.9 + (position.z + d1)*0.9) * magnitude;
        //position.z += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.z + d2)*0.9 + (position.x + d3)*0.9) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (15.0 * speed)) + (position.z + d2) + (position.x + d3)) * magnitude;
        position.y -= 0.04;
    }
    //still water
    if (mc_Entity.x == 111.0 && texcoord.t > 0.05) {
        float speed = 2.7;
        float magnitude = (sin((worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.05 + 0.15) * 0.17;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (132.0 * speed)) * 3.0 - 1.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (13.0 * speed)) + (position.x + d0)*0.9 + (position.z + d1)*0.9) * magnitude;
        //position.z += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.z + d2)*0.9 + (position.x + d3)*0.9) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (15.0 * speed)) + (position.z + d2) + (position.x + d3)) * magnitude;
        position.y -= 0.04;
    }
#endif
   
#ifdef WAVING_LAVA
    //flowing lava
    if (mc_Entity.x == 10.0 && texcoord.t > 0.01) {
        float speed = 4.0;
        float magnitude = (sin((worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.05 + 0.15) * 0.27;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (162.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        //position.x += sin((worldTime * 3.14159265358979323846264 / (13.0 * speed)) + (position.x + d0)*0.9 + (position.z + d1)*0.9) * magnitude;
        //position.z += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.z + d2)*0.9 + (position.x + d3)*0.9) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (15.0 * speed)) + (position.z + d2) + (position.x + d3)) * magnitude;
    }
    //still lava
    if (mc_Entity.x == 11.0 && texcoord.t > 0.01) {
        float speed = 4.0;
        float magnitude = (sin((worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.05 + 0.15) * 0.27;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (162.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        //position.x += sin((worldTime * 3.14159265358979323846264 / (13.0 * speed)) + (position.x + d0)*0.9 + (position.z + d1)*0.9) * magnitude;
        //position.z += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.z + d2)*0.9 + (position.x + d3)*0.9) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (15.0 * speed)) + (position.z + d2) + (position.x + d3)) * magnitude;
    }
#endif
   
#ifdef WAVING_VINES
    //large scale movement
    if (mc_Entity.x == 106.0 && texcoord.t < 0.60) {//1.20) {
        float speed = 3.0;
        float magnitude = (sin(((position.y + position.x)/2.0 + worldTime * 3.14159265358979323846264 / ((88.0)))) * 0.05 + 0.15) * 0.26;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (152.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (192.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.x + d0)*0.5 + (position.z + d1)*0.5 + (position.y)) * magnitude;
        //position.x -= 0.05;
        position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*0.5 + (position.x + d3)*0.5 + (position.y)) * magnitude;
        //position.z -= 0.05;
        //position.y += sin((worldTime * 3.14159265358979323846264 / (10.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/2.0);
    }
   
    //small scale movement
    if (mc_Entity.x == 106.0 && texcoord.t < 0.20) {
        float speed = 1.1;
        float magnitude = (sin(((position.y + position.x)/8.0 + worldTime * 3.14159265358979323846264 / ((88.0)))) * 0.15 + 0.05) * 0.22;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 + 0.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 + 0.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 + 0.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 + 0.5;
        position.x += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (-position.x + d0)*1.6 + (position.z + d1)*1.6) * magnitude;
        //position.x -= 0.05;
        position.z += sin((worldTime * 3.14159265358979323846264 / (18.0 * speed)) + (position.z + d2)*1.6 + (-position.x + d3)*1.6) * magnitude;
        //position.z -= 0.05;
        position.y += sin((worldTime * 3.14159265358979323846264 / (11.0 * speed)) + (position.z + d2) + (position.x + d3)) * (magnitude/4.0);
    }
#endif



	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
	
	color = gl_Color;
	
	lmcoord = gl_TextureMatrix[1] * gl_MultiTexCoord1;
	
	gl_FogFragCoord = gl_Position.z;
	
}