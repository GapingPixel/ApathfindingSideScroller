//
// Simple passthrough fragment shader
//
varying vec2 v_vPosition;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

uniform float Time;
vec2 Size = vec2(256,128);
vec2 Wave = vec2(48,6);

void main()
{
    vec2 Coord = v_vTexcoord + vec2(cos((v_vPosition.y/(Wave.x)+Time)*12.0)*Wave.y,0)/Size*(1.0-v_vTexcoord.y);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
}
