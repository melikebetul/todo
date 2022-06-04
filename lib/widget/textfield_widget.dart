import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget{
  final int maxlines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({Key? key, 
  required this.label, required this.text, required this.onChanged, this.maxlines=1,
  }):super(key: key);
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>{
  late final TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(height: 8,),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )
        ),
        maxLines: widget.maxlines,
      )
    ],
  );

}
