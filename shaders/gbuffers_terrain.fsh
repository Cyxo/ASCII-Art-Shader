#version 120


/* DRAWBUFFERS:0NNN4 */

////////////////////////////////////////////////////ADJUSTABLE VARIABLES/////////////////////////////////////////////////////////

uniform sampler2D texture;


uniform int worldTime;

uniform vec3 sunPosition;
uniform vec3 moonPosition;

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;



const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;







void main() {	

	
	vec2 adjustedTexCoord = texcoord.st;

	vec3 indlmap = mix(pow(min(lmcoord.t,1.0),3.0),1.0,lmcoord.s)*texture2D(texture,adjustedTexCoord).rgb*color.rgb;
	gl_FragData[0] = vec4(indlmap,texture2D(texture,adjustedTexCoord).a*color.a);
	
	gl_FragDepth = gl_FragCoord.z;
	
	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05)/translucent(0.4) / z = torch lightmap
	
	gl_FragData[4] = vec4(0.0, 1.0, lmcoord.s, 0.0);
	
}