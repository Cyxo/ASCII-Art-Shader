#version 120
/* DRAWBUFFERS:0NNN4 */
varying vec4 color;

const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;


void main() {

	float skymask;
	float alphamask;
	

	gl_FragData[0] = color;
	gl_FragDepth = gl_FragCoord.z;
	


	
	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05) / z = torch lightmap
	gl_FragData[4] = vec4(0.0, 0.0, 0.0, 1.0);
	

	if (fogMode == GL_EXP) {
		gl_FragData[0].rgb = mix(gl_FragData[0].rgb, (gl_Fog.color.rgb * 1.0), 1.0 - clamp(exp(-gl_Fog.density * gl_FogFragCoord), 0.0, 1.0));
	} else if (fogMode == GL_LINEAR) {
		gl_FragData[0].rgb = mix(gl_FragData[0].rgb, (gl_Fog.color.rgb * 1.0), clamp((gl_FogFragCoord - gl_Fog.start) * gl_Fog.scale, 0.0, 1.0));
	}
}