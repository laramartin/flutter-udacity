// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units

  var userInput = '';

  String currentUnit;

  // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that includes
    // includes the output value, and 'from' unit [Dropdown].

    // TODO: Create a compare arrows icon.

    // TODO: Create the 'output' group of widgets. This is a Column that

    // TODO: Return the input, arrows, and output widgets, wrapped in

    var _dropdownButton = Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            border: Border.all(
              color: Color(0x77000000),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentUnit,
              onChanged: (String newUnit) {
                setState(() {
                  currentUnit = newUnit;
                });
              },
              items: widget.units.map((Unit unit) {
                return DropdownMenuItem<String>(
                  child: new Text(unit.name),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'input', border: OutlineInputBorder()),
          ),
          _dropdownButton,
        ],
      ),
    );
  }
}
