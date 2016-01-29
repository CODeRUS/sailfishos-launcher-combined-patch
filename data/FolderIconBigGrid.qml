import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property var icons: []
    property bool pressed

    property int size: Theme.iconSizeLauncher
    property int iconSize: size * 0.3

    width: size
    height: size
	
	Grid {
		columns: 3
		rows: 3
		spacing: Theme.paddingSmall
    
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 0
			source: visible ? iconSource(icons[0]) : ""

			smooth: !iconIsLink(source)
		}

		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 1
			source: visible ? iconSource(icons[1]) : ""

			smooth: !iconIsLink(source)
		}

		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 2
			source: visible ? iconSource(icons[2]) : ""

			smooth: !iconIsLink(source)
		}

		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 3
			source: visible ? iconSource(icons[3]) : ""

			smooth: !iconIsLink(source)
		}
		
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 4
			source: visible ? iconSource(icons[4]) : ""

			smooth: !iconIsLink(source)
		}
		
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 5
			source: visible ? iconSource(icons[5]) : ""

			smooth: !iconIsLink(source)
		}
		
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 6
			source: visible ? iconSource(icons[6]) : ""

			smooth: !iconIsLink(source)
		}
		
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 7
			source: visible ? iconSource(icons[7]) : ""

			smooth: !iconIsLink(source)
		}
		
		Image {
			width: iconSize
			height: iconSize

			visible: icons.length > 8
			source: visible ? iconSource(icons[8]) : ""

			smooth: !iconIsLink(source)
		}	
	}
}