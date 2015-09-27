import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property var icons: []
    property bool pressed

    property int size: Theme.iconSizeLauncher
    property int iconSize: size * 0.45

    width: size
    height: size

    Image {
        width: iconSize
        height: iconSize
        anchors.top: parent.top
        anchors.right: parent.right

        visible: icons.length > 3
        source: visible ? iconSource(icons[3]) : ""

        smooth: !iconIsLink(source)
    }

    Image {
        width: iconSize
        height: iconSize
        anchors.top: parent.top
        anchors.left: parent.left

        visible: icons.length > 2
        source: visible ? iconSource(icons[2]) : ""

        smooth: !iconIsLink(source)
    }

    Image {
        width: iconSize
        height: iconSize
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        visible: icons.length > 1
        source: visible ? iconSource(icons[1]) : ""

        smooth: !iconIsLink(source)
    }

    Image {
        width: iconSize
        height: iconSize
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        visible: icons.length > 0
        source: visible ? iconSource(icons[0]) : ""

        smooth: !iconIsLink(source)
    }
}
