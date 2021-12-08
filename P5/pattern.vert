#version 330 compatibility


uniform float    uTime;        // "Time", from Animate( )
uniform int     uBottonControl;
varying vec2      vST;        // texture coords

const float PI =     3.14159265;
const float AMP =     0.2;        // amplitude
const float W =     2.;        // frequency

varying vec3 vN;// normal vector
varying vec3 vL;// vector from point to light
varying vec3 vE; // vector from point to eye

const vec3 LIGHTPOSITION = vec3( 0., 10., 10. );
void
main( )
{
    
    
    vST = gl_MultiTexCoord0.st;
    vec3 vert = gl_Vertex.xyz;
    
    vert.x *= 0.1 * (sin(PI*uTime)) +1;
    vert.y *= 0.1 * (cos(PI*uTime))+1;

    
    vST = gl_MultiTexCoord0.st;
    vec4 ECposition = gl_ModelViewMatrix * gl_Vertex;
    vec4 p = gl_ModelViewMatrix * vec4 (LIGHTPOSITION,1);
    vec3 uLightPosition = p.xyz;
    vN = normalize( gl_NormalMatrix * gl_Normal );// normal vector
    vL = LIGHTPOSITION - ECposition.xyz;// vector from the point to the light position
    
    vE = vec3( 0., 1., 1. ) - ECposition.xyz;// vector from the point to the eye position
    
    gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. );
}
