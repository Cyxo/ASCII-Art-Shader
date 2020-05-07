#version 120

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;


//varying vec4 bloommask;

//attribute vec4 mc_Entity;

void main() {

	gl_Position = ftransform();
	
	color = gl_Color;
	
	texcoord = gl_TextureMatrix[0] * gl_MultiTexCoord0;

	lmcoord = gl_TextureMatrix[1] * gl_MultiTexCoord1;
	


	gl_FogFragCoord = gl_Position.z;
	}