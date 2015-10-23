import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property var icons: []
    property bool pressed

    property int size: Theme.iconSizeLauncher
    property int iconSize: size * 0.8

    width: size
    height: size

    Image {
        width: iconSize
        height: iconSize
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        visible: icons.length > 2
        source: visible ? iconSource(icons[2]) : ""

        smooth: !iconIsLink(source)
    }

    Image {
        width: iconSize
        height: iconSize
        anchors.centerIn: parent

        visible: icons.length > 1
        source: visible ? iconSource(icons[1]) : ""

        smooth: !iconIsLink(source)
    }

    Image {
        width: iconSize
        height: iconSize
        anchors.left: parent.left
        anchors.top: parent.top

        visible: icons.length > 0
        source: visible ? iconSource(icons[0]) : ""

        smooth: !iconIsLink(source)
    }
}
