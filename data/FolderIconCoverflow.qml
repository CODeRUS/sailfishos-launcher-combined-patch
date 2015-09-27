import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property var icons: []
    property bool pressed

    property int size: Theme.iconSizeLauncher
    property int sideIconSize: size * 0.9
    property int centerIconSize: size * 0.8

    width: size
    height: size

    Image {
        id: leftImage

        width: sideIconSize
        height: sideIconSize
        anchors.horizontalCenter: centerImage.left
        anchors.verticalCenter: centerImage.verticalCenter

        visible: icons.length > 1
        source: visible ? iconSource(icons[1]) : ""

        transform: Rotation { origin.x: leftImage.width / 2; origin.y: leftImage.height / 2; axis { x: 0; y: 1; z: 0 } angle: 72 }

        smooth: !iconIsLink(source)
    }

    Image {
        id: rightImage

        width: sideIconSize
        height: sideIconSize
        anchors.horizontalCenter: centerImage.right
        anchors.verticalCenter: centerImage.verticalCenter

        visible: icons.length > 2
        source: visible ? iconSource(icons[2]) : ""

        transform: Rotation { origin.x: rightImage.width / 2; origin.y: rightImage.height / 2; axis { x: 0; y: 1; z: 0 } angle: -72 }

        smooth: !iconIsLink(source)
    }

    Image {
        id: centerImage

        width: centerIconSize
        height: centerIconSize
        anchors.centerIn: parent

        visible: icons.length > 0
        source: visible ? iconSource(icons[0]) : ""

        smooth: !iconIsLink(source)
    }
}
