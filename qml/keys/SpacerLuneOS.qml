/*
 * Copyright 2013 Canonical Ltd.
 * Copyright (C) 2015 Christophe Chapuis <chris.chapuis@gmail.com>
 * Copyright (C) 2015 Herman van Hazendonk <github.com@herrie.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtMultimedia 5.0

import LunaNext.Common 0.1

Item {
    id: key

    property int padding: 0

    width: UI.keyWidth
    height: UI.keyHeight
    property string imgNormal: UI.imageWhiteKey
    property string imgPressed: UI.imageWhiteKeyPressed


  
    BorderImage {
        id: buttonImage
        border { left: 27; top: 29; right: 27; bottom: 29 }
        anchors.centerIn: parent
        anchors.fill: key
        anchors.margins: Units.dp( UI.keyMargins );
        source: key.imgNormal
    }


    Connections {
        target: swipeArea.drag
        onActiveChanged: {
            if (swipeArea.drag.active)
                keyMouseArea.cancelPress();
        }
    }

}