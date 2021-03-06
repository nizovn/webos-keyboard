/*
 * Copyright (C) 2013 Christophe Chapuis <chris.chapuis@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

pragma Singleton

import QtQuick 2.0
import "StorageStub.js" as Storage

QtObject {
    // Utility to convert a pixel length expressed at DPI=132 to
    // a pixel length expressed in our DPI
    function length(lengthAt132DPI) {
        return (lengthAt132DPI * Storage.layoutScale);
    }

    property int _DEFAULT_GRID_UNIT_PX: 8;

    function dp(value) {
        return Storage.dp(value);
    }

    function gu(value) {
        return Storage.gu(value);
    }
}
