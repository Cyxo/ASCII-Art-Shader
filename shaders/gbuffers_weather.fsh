#version 120

uniform sampler2D texture;

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;

void main() {

/* DRAWBUFFERS:0NNN4 */
	gl_FragData[0] = vec4((texture2D(texture,texcoord.xy)*color).rgb,0.09*(1.0-step((texture2D(texture,texcoord.xy)*color).a,0.25)));
	gl_FragDepth = gl_FragCoord.z;
	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05) / z = torch lightmap
	gl_FragData[4] = vec4(0.0, 0.7, lmcoord.s, 1.0);

		
}