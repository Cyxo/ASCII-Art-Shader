#version 120

#define WAVING_WATER

uniform int worldTime;

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;

attribute vec4 mc_Entity;

varying float iswater;



//varying vec4 bloommask;

//attribute vec4 mc_Entity;

void main() {

	iswater = 0.0f;

	vec4 position = gl_Vertex;
	
	if (mc_Entity.x == 8.0 || mc_Entity.x == 9.0) {
	iswater = 1.0;
		float speed = 1.0;
        float magnitude = (sin((worldTime * 3.14159265358979323846264 / ((28.0) * speed))) * 0.05 + 0.15) * 0.27;
        float d0 = sin(worldTime * 3.14159265358979323846264 / (122.0 * speed)) * 3.0 - 1.5;
        float d1 = sin(worldTime * 3.14159265358979323846264 / (142.0 * speed)) * 3.0 - 1.5;
        float d2 = sin(worldTime * 3.14159265358979323846264 / (162.0 * speed)) * 3.0 - 1.5;
        float d3 = sin(worldTime * 3.14159265358979323846264 / (112.0 * speed)) * 3.0 - 1.5;
        //position.x += sin((worldTime * 3.14159265358979323846264 / (13.0 * speed)) + (position.x + d0)*0.9 + (position.z + d1)*0.9) * magnitude;
        //position.z += sin((worldTime * 3.14159265358979323846264 / (16.0 * speed)) + (position.z + d2)*0.9 + (position.x + d3)*0.9) * magnitude;
        position.y += sin((worldTime * 3.14159265358979323846264 / (15.0 * speed)) + (position.z + d2) + (position.x + d3)) * magnitude;
	}
	
		


	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);

	
	color = gl_Color;
	
	texcoord = gl_TextureMatrix[0] * gl_MultiTexCoord0;

	lmcoord = gl_TextureMatrix[1] * gl_MultiTexCoord1;
	


	gl_FogFragCoord = gl_Position.z;
	


	
}