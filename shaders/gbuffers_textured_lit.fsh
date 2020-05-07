#version 120
uniform sampler2D texture;

uniform float rainStrength;


varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;


const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;

void main() {

	vec4 tex = texture2D(texture, texcoord.st);

/* DRAWBUFFERS:0NNN4 */


	vec3 indlmap = mix(pow(min(lmcoord.t+0.1,1.0),2.0),1.0,lmcoord.s)*texture2D(texture,texcoord.xy).rgb*color.rgb;
	gl_FragData[0] = vec4(indlmap,texture2D(texture,texcoord.xy).a*color.a);
	
	gl_FragDepth = gl_FragCoord.z;
	
	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05) / z = torch lightmap
	gl_FragData[4] = vec4(0.0, 1.0, lmcoord.s, 1.0);
}