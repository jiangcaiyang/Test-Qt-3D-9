import Qt3D 2.0
import Qt3D.Render 2.0

Entity
{
    id: root

    Camera
    {
        id: camera
        position: Qt.vector3d( 0.0, 0.0, -40.0 )
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: 16.0 / 9.0
        nearPlane : 0.1
        farPlane : 1000.0
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }

    components: frameGraph
    FrameGraph
    {
        id: frameGraph
        ForwardRenderer
        {
            clearColor: Qt.rgba( 0.2, 0.9, 0.5, 1 )
            camera: camera
        }
    }

    Entity
    {
        Mesh
        {
            id: mesh
            objectName: "cube"
            source: "qrc:/toyplane.obj"
        }

        Material
        {
            id: material
            effect: SilhouetteEffect { }
        }

        components: [ mesh, material ]
    }

    Configuration
    {
        controlledCamera: camera
    }
}
