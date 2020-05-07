#version 120

uniform sampler2D texture;

varying vec4 color;
varying vec4 texcoord;

const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;

void main() {
/* DRAWBUFFERS:0NNN4 */


	gl_FragData[0] = texture2D(texture,texcoord.xy)*color;
	gl_FragDepth = gl_FragCoord.z;
	


	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05) / z = torch lightmap
	gl_FragData[4] = vec4(0.0, 0.0, 0.0, 1.0);


}