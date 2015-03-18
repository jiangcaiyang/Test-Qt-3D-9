import Qt3D 2.0
import Qt3D.Render 2.0

Effect
{
    id: effect

    techniques: [ technique ]

    Technique
    {
        id: technique
        openGLFilter
        {
            api: OpenGLFilter.Desktop
            profile: OpenGLFilter.None
            majorVersion: 2
            minorVersion: 0
        }

        parameters:
        [
            Parameter
            {
                name: "lightPosition"
                value: camera.position
            }
        ]

//        Texture2D
//        {
//            id: texPalette

//            TextureImage
//            {
//                source: "qrc:/discreetPalette.png"
//            }
//        }

        renderPasses: [ toonMapPass ]
        RenderPass
        {
            id: toonMapPass

            shaderProgram: toonSP
            ShaderProgram
            {
                id: toonSP
                vertexShaderCode: loadSource( "qrc:/Silhouette.vert" )
                fragmentShaderCode: loadSource( "qrc:/Silhouette.frag" )
            }
            renderStates:
            [
                DepthTest { func: DepthTest.LessOrEqual }
                //PolygonOffset { factor: 4; units: 4 }
                //CullFace { mode: CullFace.Front }
            ]
        }
    }
}
