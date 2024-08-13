import 'package:flutter/material.dart';

class NumberInputPage extends StatefulWidget {
  const NumberInputPage({super.key});

  @override
  NumberInputPageState createState() => NumberInputPageState();
}

class NumberInputPageState extends State<NumberInputPage> {
  String amount = "0.00";

  void _onNumberPressed(String number) {
    setState(() {
      if (amount == "0.00") {
        amount = "0.0$number";
      } else {
        var parts = amount.split('.');
        String integerPart = parts[0];
        String decimalPart = parts[1];

        if (integerPart == "0") {
          integerPart = "";
        }

        if (decimalPart == "00") {
          integerPart += number;
        } else {
          integerPart += decimalPart[0];
          decimalPart = decimalPart.substring(1) + number;
        }

        amount = '$integerPart.$decimalPart';
      }
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (amount != "0.00") {
        var parts = amount.split('.');
        String integerPart = parts[0];
        String decimalPart = parts[1];

        if (decimalPart != "00") {
          decimalPart = integerPart.isNotEmpty
              ? integerPart[integerPart.length - 1] +
                  decimalPart.substring(0, 1)
              : "0${decimalPart.substring(0, 1)}";
          integerPart = integerPart.isNotEmpty
              ? integerPart.substring(0, integerPart.length - 1)
              : "0";
        } else if (integerPart.isNotEmpty && integerPart != "0") {
          integerPart = integerPart.substring(0, integerPart.length - 1);
        }

        if (integerPart.isEmpty) integerPart = "0";
        if (decimalPart == "00" && integerPart == "0") {
          amount = "0.00";
        } else {
          amount = '$integerPart.$decimalPart';
        }
      }
    });
  }

  void _setPresetValue(String value) {
    setState(() {
      amount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Amount'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Enter amount',
            style: TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 10),
          Text(
            'RM $amount',
            style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _setPresetValue("50.00"),
                child: const Text("50.00"),
              ),
              ElevatedButton(
                onPressed: () => _setPresetValue("100.00"),
                child: const Text("100.00"),
              ),
              ElevatedButton(
                onPressed: () => _setPresetValue("500.00"),
                child: const Text("500.00"),
              ),
              ElevatedButton(
                onPressed: () => _setPresetValue("100000.00"),
                child: const Text("MAX"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Here you would include your number pad (similar to the layout you've shown)
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                _buildNumberButton("1"),
                _buildNumberButton("2"),
                _buildNumberButton("3"),
                _buildNumberButton("4"),
                _buildNumberButton("5"),
                _buildNumberButton("6"),
                _buildNumberButton("7"),
                _buildNumberButton("8"),
                _buildNumberButton("9"),
                _buildDeleteButton(),
                _buildNumberButton("0"),
                _buildConfirmButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () => _onNumberPressed(number),
      child: Text(number, style: const TextStyle(fontSize: 24.0)),
    );
  }

  Widget _buildDeleteButton() {
    return ElevatedButton(
      onPressed: _onDeletePressed,
      child: const Icon(Icons.backspace, size: 24.0),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle confirmation action
      },
      child: const Icon(Icons.check, size: 24.0),
    );
  }
}
