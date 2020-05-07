#version 120

/* DRAWBUFFERS:0NNN4 */
////////////////////////////////////////////////////ADJUSTABLE VARIABLES/////////////////////////////////////////////////////////

#define POM 								//Comment to disable parallax occlusion mapping.
#define NORMAL_MAP_MAX_ANGLE 0.88f   		//The higher the value, the more extreme per-pixel normal mapping (bump mapping) will be.





/* Here, intervalMult might need to be tweaked per texture pack.  
   The first two numbers determine how many samples are taken per fragment.  They should always be the equal to eachother.
   The third number divided by one of the first two numbers is inversely proportional to the range of the height-map. */

uniform sampler2D texture;


varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;


const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;


const float bump_distance = 80.0f;
const float fademult = 0.1f;





void main() {	



		
	
	vec2 adjustedTexCoord = texcoord.st;
	float texinterval = 0.0625f;

				  
	float pomdepth = 0.0;

	vec3 indlmap = mix(pow(min(lmcoord.t+0.1,1.0),2.0),1.0,lmcoord.s)*texture2D(texture,adjustedTexCoord).rgb*color.rgb;
	gl_FragData[0] = vec4(indlmap,texture2D(texture,adjustedTexCoord).a*color.a);
	gl_FragDepth = gl_FragCoord.z;
	
	
	//x = specularity / y = land(0.0/1.0)/shadow early exit(0.2)/water(0.05)/hand(0.8) / z = torch lightmap
	gl_FragData[4] = vec4(0.0, 1.0, lmcoord.s, 0.0f);
	
	

}