import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: launcherViewSettings
        path: "/apps/lipstick-jolla-home-qt5/launcherView"
        property bool glassBackground: false
        property bool themedBackgroundColor: false
        property real backgroundOpacity: 1.0
    }

    ConfigurationGroup {
        id: launcherGridSettings
        path: "/apps/lipstick-jolla-home-qt5/launcherGrid"
        property int columns: 4
        property int rows: 6
        property bool editLabelVisible: true
        property bool zoomIcons: false
        property bool zoomFonts: false
        property real zoomValue: 1.0
    }

    ConfigurationGroup {
        id: launcherSettings
        path: "/apps/lipstick-jolla-home-qt5/launcher"
        property bool freeScroll: false
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: content.height

        VerticalScrollDecorator {}

        Column {
            id: content
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "Launcher settings"
            }

            SectionHeader {
                text: "Grid"
            }

            Slider {
                width: parent.width
                label: "Columns count"
                maximumValue: 10
                minimumValue: 2
                stepSize: 1
                value: launcherGridSettings.columns
                valueText: value

                onReleased: launcherGridSettings.columns = Math.round(value)
            }

            Slider {
                width: parent.width
                label: "Rows count"
                maximumValue: 10
                minimumValue: 2
                stepSize: 1
                value: launcherGridSettings.rows
                valueText: value

                onValueChanged: launcherGridSettings.rows = Math.round(value)
            }

            TextSwitch {
                width: parent.width
                text: "Change font size"
                checked: launcherGridSettings.zoomFonts
                onClicked: launcherGridSettings.zoomFonts = checked
            }

            TextSwitch {
                width: parent.width
                text: "Change icons size"
                checked: launcherGridSettings.zoomIcons
                onClicked: launcherGridSettings.zoomIcons = checked
            }

            Slider {
                width: parent.width
                label: "Zoom value"
                maximumValue: 200
                minimumValue: 40
                stepSize: 1
                value: launcherGridSettings.zoomValue * 100
                valueText: parseInt(value) + "%"

                onValueChanged: launcherGridSettings.zoomValue = value / 100.0
            }

            TextSwitch {
                width: parent.width
                text: "Show labels in edit mode"
                checked: launcherGridSettings.editLabelVisible
                onClicked: launcherGridSettings.editLabelVisible = checked
            }

            TextSwitch {
                width: parent.width
                text: "Free scroll view"
                checked: launcherSettings.freeScroll
                onClicked: launcherSettings.freeScroll = checked
            }

            SectionHeader {
                text: "Background"
            }

            TextSwitch {
                width: parent.width
                text: "Use themed background"
                checked: launcherViewSettings.glassBackground
                onClicked: launcherViewSettings.glassBackground = checked
            }

            TextSwitch {
                visible: !launcherViewSettings.glassBackground
                width: parent.width
                text: "Use system color background"
                checked: launcherViewSettings.themedBackgroundColor
                onClicked: launcherViewSettings.themedBackgroundColor = checked
            }

            Slider {
                width: parent.width
                label: "Background opacity"
                maximumValue: 100
                minimumValue: 0
                stepSize: 1
                value: launcherViewSettings.backgroundOpacity * 100
                valueText: parseInt(value) + "%"

                onValueChanged: launcherViewSettings.backgroundOpacity = value / 100.0
            }
        }
    }
}
