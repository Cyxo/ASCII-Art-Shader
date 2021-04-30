#version 120


/*

Chocapic13' shaders, derived from SonicEther v10 rc6
Place two leading Slashes in front of the following '#define' lines in order to disable an option.

*/


#define GODRAYS
#define GODRAYS_EXPOSURE 0.11
#define GODRAYS_SAMPLES 6
#define GODRAYS_DECAY 0.99
#define GODRAYS_DENSITY 0.30
#define LENS				
#define LENS_POWER 0.34						//lens effect intensity	
//#define BLOOM								
//#define DOF								//broken



//color post-process
#define VIGNETTE
#define VIGNETTE_STRENGTH 1.3
#define CROSSPROCESS
#define BRIGHTMULT 1.0                 	// 1.0 = default brightness. Higher values mean brighter. 0 would be black.
#define DARKMULT 0.00						// 0.0 = normal image. Higher values will darken dark colors.
#define COLOR_BOOST	0.1					// 0.0 = normal saturation. Higher values mean more saturated image.
#define HIGHDESATURATE
#define GAMMA 1.0							//1.0 is default brightness. lower values will brighten image, higher values will darken image	
#define TONEMAP
#define TONEMAP_CURVE 0.5


//#define WATER_REFLECTIONS
uniform int isEyeInWater;

//don't touch these lines if you don't know what you do!
const float stp = 0.5;			//size of one step for raytracing algorithm
const float ref = 0.1;			//refinement multiplier
const float inc = 2.0;			//increasement factor at each step
const int maxf = 5;				//number of refinements



// DOF Constants - DO NOT CHANGE
// HYPERFOCAL = (Focal Distance ^ 2)/(Circle of Confusion * F Stop) + Focal Distance
#ifdef USE_DOF
const float HYPERFOCAL = 3.132;
const float PICONSTANT = 3.14159;
#endif





uniform sampler2D depthtex0;
uniform sampler2D gnormal;
uniform sampler2D gaux2;
uniform sampler2D composite;


uniform mat4 gbufferProjection;
uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferPreviousProjection;

uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferPreviousModelView;

uniform vec3 cameraPosition;
uniform vec3 previousCameraPosition;

uniform vec3 sunPosition;

uniform ivec2 eyeBrightness;

uniform int worldTime;
uniform float aspectRatio;
uniform float near;
uniform float far;
uniform float viewWidth;
uniform float viewHeight;
uniform float rainStrength;
uniform float wetness;

varying vec4 texcoord;
varying vec3 sunlight;



//Raining
float rainx = clamp(rainStrength, 0.0, 1.0)/1.0;
float wetx  = clamp(wetness, 0.0, 1.0);


float pw = 1.0/ viewWidth;
float ph = 1.0/ viewHeight;


float character(int n, vec2 p)
{
	p = floor(p*vec2(4.0, -4.0) + 2.5);
    if (clamp(p.x, 0.0, 4.0) == p.x)
	{
        if (clamp(p.y, 0.0, 4.0) == p.y)	
		{
			if (int(mod(n/exp2(p.x + 5.0*p.y), 2.0)) == 1) return 1.0;
		}	
    }
	return 0.0;
}


// Main --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void main() {
  vec2 size = vec2(480/viewHeight*viewWidth, 480.0);
  vec2 pix = texcoord.st*size;
  
	vec3 color = texture2D(composite, floor(pix/8.0)/size*8.0).rgb;
	vec3 col = color;
	// float land = texture2D(composite, texcoord.st).a;
	
	float gray = 0.3 * col.r + 0.59 * col.g + 0.11 * col.b;

	col /= max(col.r, max(col.g, col.b));
	
	int n =  4096;                // .
	if (gray > 0.1) n = 65600;    // :
	if (gray > 0.2) n = 332772;   // *
	if (gray > 0.3) n = 15255086; // o 
	if (gray > 0.4) n = 23385164; // &
	if (gray > 0.5) n = 15252014; // 8
	if (gray > 0.6) n = 13199452; // @
	if (gray > 0.7) n = 11512810; // #
	
	vec2 p = mod(pix/4.0, 2.0) - vec2(1.0);
  
	col = col*character(n, p);
  
	gl_FragColor = vec4(col, 1.0);
	
// End of Main. -----------------
}
