import 'package:flutter/material.dart';
import 'package:task_06_input/unit.dart';

const _padding = EdgeInsets.all(16.0);

class InputGroupWidget extends StatefulWidget {
  final List<Unit> units;

  final String title;

  InputGroupWidget(this.units, this.title);

  @override
  State<StatefulWidget> createState() => InputGroupWidgetState();
}

class InputGroupWidgetState extends State<InputGroupWidget> {
  var userInput = '';

  Unit currentUnit;

  List<DropdownMenuItem<Unit>> _items;

  bool _showValidationError = false;

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

  List<DropdownMenuItem<Unit>> _createListItems(List<Unit> units) {
    return units.map((Unit unit) {
      return DropdownMenuItem<Unit>(
        value: unit,
        child: new Text(unit.name),
      );
    }).toList();
  }

  @override
  void initState() {
    _items = _createListItems(widget.units);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: DropdownButton<Unit>(
              value: currentUnit,
              onChanged: (Unit newUnit) {
                setState(() {
                  currentUnit = newUnit;
                });
              },
              items: _items,
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
                labelText: widget.title,
                border: OutlineInputBorder(),
                errorText: _showValidationError ? 'Invalid input' : null),
            keyboardType: TextInputType.number,
            onChanged: _updateText,
          ),
          _dropdownButton,
        ],
      ),
    );
  }

  void _updateText(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
        _showValidationError = false;
        return;
      }
      try {
        final inputDouble = double.parse(input);
        _showValidationError = false;
      } on Exception catch (e) {
        print('Error: $e');
        _showValidationError = true;
      }
    });
  }
}
