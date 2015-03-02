import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property variant icons: []
    property bool pressed

    width: Theme.iconSizeLauncher
    height: Theme.iconSizeLauncher

    layer.effect: pressEffectComponent
    layer.enabled: pressed

    Flow {
        id: folderIcons
        anchors.fill: parent
        spacing: 0
        Repeater {
            model: icons
            delegate: Image {
                width: folderIcons.width / 2
                height: folderIcons.width / 2

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                fillMode: Image.Pad

                sourceSize.width: width - Theme.paddingSmall / 2
                sourceSize.height: height - Theme.paddingSmall / 2

                smooth: true

                source: {
                    if (modelData.indexOf(':/') !== -1 || modelData.indexOf("data:") == 0) {
                        return modelData
                    } else if (modelData.indexOf('/') === 0) {
                        return 'file://' + modelData
                    } else {
                        return 'image://theme/' + modelData
                    }
                }
            }
        }
    }

    Component {
        id: pressEffectComponent
        ShaderEffect {
            property variant source
            property color color: Theme.rgba(Theme.highlightBackgroundColor, 0.4)
            fragmentShader: "
            uniform sampler2D source;
            uniform highp vec4 color;
            uniform lowp float qt_Opacity;
            varying highp vec2 qt_TexCoord0;
            void main(void)
            {
                highp vec4 pixelColor = texture2D(source, qt_TexCoord0);
                gl_FragColor = vec4(mix(pixelColor.rgb/max(pixelColor.a, 0.00390625), color.rgb/max(color.a, 0.00390625), color.a) * pixelColor.a, pixelColor.a) * qt_Opacity;
            }
            "
        }
    }
}
