import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:provider/provider.dart';

class RulerPickerInput extends StatefulWidget {
  final TextEditingController controller;
  final void Function(int)? update;
  final void Function(String)? onChanged;
  int value;

  RulerPickerInput(
      {Key? key,
      required this.controller,
      this.update,
      this.onChanged,
      required this.value})
      : super(key: key);

  @override
  _RulerPickerInputState createState() => _RulerPickerInputState();
}

class _RulerPickerInputState extends State<RulerPickerInput> {
  RulerPickerController? _rulerPickerController =
      RulerPickerController(value: 50);

  //TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: widget.value);
    print(widget.value);
    // widget.controller.text =
    //     (widget.value == 0) ? '50' : widget.value.toString();
        print(widget.controller.text);
    widget.controller.text = widget.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final SelectedValues = Provider.of<AuthenticationProvider2>(context);
    widget.value = 50;
    _rulerPickerController?.value = widget.value;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.10,
              child: Consumer<AuthenticationProvider2>(
                  builder: (context, auth, child) {
                return TextField(
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  // onChanged: (newValue) {
                  //   print(newValue);
                  //   setState(() {
                  //     currentValue = int.tryParse(newValue) ?? currentValue;
                  //     _rulerPickerController?.value = currentValue.toInt();
                  //   });
                  // },
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                  keyboardType: TextInputType.number,
                );
              })),
          const SizedBox(height: 10),
          Consumer<AuthenticationProvider2>(builder: (context, auth, child) {
            return RulerPicker(
              controller: _rulerPickerController!,
              beginValue: 30,
              endValue: 100,
              initValue: widget.value,
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
                widget.update!(value);
                print(value);
                setState(() {
                  widget.controller.text = value.toString();
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 70,
              rulerMarginTop: 8,
            );
          }),
        ],
      ),
    );
  }
}
