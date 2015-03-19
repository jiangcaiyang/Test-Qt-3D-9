// Silhouette.frag
#version 110

// 自己提供的参数
varying float lightIntensity;

void main( void )
{
    vec4 light = vec4( 0.9, 0.7, 0.5, 1.0 );
    vec4 dark = vec4( 0.0, 0.0, 0.0, 1.0 );
    gl_FragColor = lightIntensity > 0.0? light: dark;
}
