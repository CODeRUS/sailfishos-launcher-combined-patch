import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Lipstick 1.0
import org.nemomobile.lipstick 0.1

Item {
    id: root

    width: size
    height: size

    property var folder
    property bool pressed

    property string icon: folder ? folder.iconId : ""
    property int size: Theme.iconSizeLauncher

    property int index: parseInt(icon.substr(-2, 2)) - 1
    property bool isFolder: folder.type == LauncherModel.Folder

    layer.effect: pressEffectComponent
    layer.enabled: isFolder && index > 15 && pressed

    Loader {
        id: loader
        anchors.centerIn: parent
        sourceComponent: !isFolder || index < 16 ? defaultFolderIcon : extraFolderIconPool[index - 16]
    }

    Component {
        id: defaultFolderIcon
        LauncherIcon {
            icon: root.icon
            pressed: root.pressed
            size: root.size
        }
    }

    function iconFolderItems(count) {
        var icons = []
        for (var i = 0; i < folder.itemCount && i < count; i++) {
            icons.push(folder.get(i).iconId)
        }
        return icons
    }

    function iconIsLink(value) {
        if (typeof(value) == "object") {
            return false
        }
        return value.indexOf(':/') !== -1 || value.indexOf("data:") == 0
    }

    function iconSource(value) {
        if (iconIsLink(value)) {
            return value
        } else if (value.indexOf('/') === 0) {
            return 'file://' + value
        } else {
            return 'image://theme/' + value
        }
    }

    property var extraFolderIconPool: [
        folderIconGridComponent,
        folderIconCoverflowComponent,
        folderIconCascadeComponent,
        folderIconStackComponent
    ]

    Component {
        id: folderIconGridComponent
        FolderIconGrid {
            icons: iconFolderItems(4)
            size: root.size
        }
    }

    Component {
        id: folderIconCoverflowComponent
        FolderIconCoverflow {
            icons: iconFolderItems(3)
            size: root.size
        }
    }

    Component {
        id: folderIconCascadeComponent
        FolderIconCascade {
            icons: iconFolderItems(3)
            size: root.size
        }
    }

    Component {
        id: folderIconStackComponent
        FolderIconStack {
            icons: iconFolderItems(4)
            size: root.size
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
