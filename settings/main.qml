import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0

Page {
    id: page

    ConfigurationGroup {
        id: launcherSettings
        path: "/apps/lipstick-jolla-home-qt5/settings"
        property int launcherColumns: 5
        property bool firstRowLabel: false
        property bool changeFontSize: true
        property bool editLabelVisible: true
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: content.height
        interactive: contentHeight > height

        Column {
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "Launcher settings"
            }

            Slider {
                width: parent.width
                label: "Columns count"
                maximumValue: 10
                minimumValue: 2
                stepSize: 1
                value: launcherSettings.launcherColumns
                valueText: value

                onValueChanged: launcherSettings.launcherColumns = Math.round(value)
                onPressAndHold: cancel()
            }

            TextSwitch {
                width: parent.width
                text: "Change font size"
                checked: launcherSettings.changeFontSize
                onClicked: launcherSettings.changeFontSize = checked
            }

            TextSwitch {
                width: parent.width
                text: "Show labels of first row"
                checked: launcherSettings.firstRowLabel
                onClicked: launcherSettings.firstRowLabel = checked
            }

            TextSwitch {
                width: parent.width
                text: "Show labels in edit mode"
                checked: launcherSettings.editLabelVisible
                onClicked: launcherSettings.editLabelVisible = checked
            }
        }
    }
}
