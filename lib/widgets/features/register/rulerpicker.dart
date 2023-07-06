import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class RulerPickerInput extends StatefulWidget {
  RulerPickerInput({Key? key}) : super(key: key);

  @override
  _RulerPickerInputState createState() => _RulerPickerInputState();
}

class _RulerPickerInputState extends State<RulerPickerInput> {
  RulerPickerController? _rulerPickerController;
  TextEditingController _textEditingController = TextEditingController();

  int currentValue = 50;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue.toInt());
    _textEditingController.text = currentValue.toString();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            child: TextField(
              controller: _textEditingController,
              onChanged: (newValue) {
                setState(() {
                  currentValue = int.tryParse(newValue) ?? currentValue;
                  _rulerPickerController?.value = currentValue.toInt();
                });
              },
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 10),
          RulerPicker(
            controller: _rulerPickerController!,
            beginValue: 30,
            endValue: 100,
            initValue: currentValue,
            scaleLineStyleList: const [
              ScaleLineStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 1.5,
                height: 30,
                scale: 0,
              ),
              ScaleLineStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 1,
                height: 25,
                scale: 5,
              ),
              ScaleLineStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 1,
                height: 15,
                scale: -1,
              ),
            ],
            onValueChange: (value) {
              setState(() {
                currentValue = value;
                _textEditingController.text = value.toString();
              });
            },
            width: MediaQuery.of(context).size.width,
            height: 70,
            rulerMarginTop: 8,
          ),
        ],
      ),
    );
  }
}
