// ToonSilhouette.vert
#version 100

// Qt 3D默认提供的参数
attribute vec3 vertexPosition;
attribute vec3 vertexNormal;
uniform mat4 modelView;
uniform mat3 modelViewNormal;
uniform mat4 modelNormalMatrix;
uniform mat4 mvp;

// 自己提供的参数
uniform vec3 lightPosition;
varying float lightIntensity;

float getLightIntensity( )
{
    vec3 ecPos = vec3( modelView * vec4( vertexPosition, 1.0 ) );
    vec3 normal = modelViewNormal * vertexNormal;
    ecPos = normalize( ecPos );
    normal = normalize( normal );
    return dot( -ecPos, normal );
}

void main( void )
{
    const float bias = 0.1;
    vec3 silhouettePosition = vertexPosition + normalize( vertexNormal ) * bias;
    lightIntensity = getLightIntensity( );
    if ( lightIntensity > 0.0 ) gl_Position = mvp * vec4( vertexPosition, 1.0 );
    else gl_Position = mvp * vec4( silhouettePosition, 1.0 );
}
