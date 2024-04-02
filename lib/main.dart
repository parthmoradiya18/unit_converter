
import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double _inputValue = 0.0;
  String _selectedInputUnit = 'm';
  String _selectedOutputUnit = 'ft';
  double _outputValue = 0.0;

  void _convert() {
    setState(() {
      switch (_selectedInputUnit) {
        case 'm':
          _outputValue = _convertMeterTo(_selectedOutputUnit, _inputValue);
          break;
        case 'ft':
          _outputValue = _convertFeetTo(_selectedOutputUnit, _inputValue);
          break;
        case 'in':
          _outputValue = _convertInchesTo(_selectedOutputUnit, _inputValue);
          break;
        case 'cm':
          _outputValue = _convertCentimetersTo(_selectedOutputUnit, _inputValue);
          break;
        case 'km':
          _outputValue = _convertKilometersTo(_selectedOutputUnit, _inputValue);
          break;
      }
    });
  }

  double _convertMeterTo(String unit, double value) {
    switch (unit) {
      case 'm':
        return value;
      case 'ft':
        return value * 3.28084;
      case 'in':
        return value * 39.3701;
      case 'cm':
        return value * 100;
      case 'km':
        return value / 1000;
      default:
        return 0.0;
    }
  }

  double _convertFeetTo(String unit, double value) {
    switch (unit) {
      case 'm':
        return value / 3.28084;
      case 'ft':
        return value;
      case 'in':
        return value * 12;
      case 'cm':
        return value * 30.48;
      case 'km':
        return value / 3280.84;
      default:
        return 0.0;
    }
  }

  double _convertInchesTo(String unit, double value) {
    switch (unit) {
      case 'm':
        return value / 39.3701;
      case 'ft':
        return value / 12;
      case 'in':
        return value;
      case 'cm':
        return value * 2.54;
      case 'km':
        return value / 39370.1;
      default:
        return 0.0;
    }
  }

  double _convertCentimetersTo(String unit, double value) {
    switch (unit) {
      case 'm':
        return value / 100;
      case 'ft':
        return value / 30.48;
      case 'in':
        return value / 2.54;
      case 'cm':
        return value;
      case 'km':
        return value / 100000;
      default:
        return 0.0;
    }
  }

  double _convertKilometersTo(String unit, double value) {
    switch (unit) {
      case 'm':
        return value * 1000;
      case 'ft':
        return value * 3280.84;
      case 'in':
        return value * 39370.1;
      case 'cm':
        return value * 100000;
      case 'km':
        return value;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(child:
      AppBar(backgroundColor: Colors.pinkAccent.shade200,
        title: Text('Unit Converter',style: TextStyle(fontSize: 20,color: Colors.black,wordSpacing: 1,letterSpacing: 1),),
      ),preferredSize: Size(0, 50)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a value',
              ),
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton<String>(
                  value: _selectedInputUnit,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedInputUnit = newValue!;
                    });
                  },
                  items: <String>['m', 'ft', 'in', 'cm', 'km'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text('To'),
                DropdownButton<String>(
                  value: _selectedOutputUnit,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOutputUnit = newValue!;
                    });
                  },
                  items: <String>['m', 'ft', 'in', 'cm', 'km'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Color(0xfffffff),
            ),
              onPressed: _convert,
              child: Text('Convert',style: TextStyle(color: Colors.black,fontSize: 18,letterSpacing: 1,),),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_outputValue $_selectedOutputUnit',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
