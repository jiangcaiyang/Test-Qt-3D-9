#
#   目标，使用一种渲染轮廓的方法，让三维模型的轮廓显示出来
#   方法如下：在Vertex Shader中，判断是不是FrontFacing，如果是的话，正常渲染
#   否则，对于顶点，往法线的方向移动一个offset，并且在Fragment Shader中填充黑色
#

TEMPLATE = app

QT += widgets qml quick 3dcore 3drenderer 3dinput 3dquick

SOURCES += main.cpp

RESOURCES += \
    Resource3D.qrc \
    Shaders.qrc \
    Image.qrc \
    QML.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
