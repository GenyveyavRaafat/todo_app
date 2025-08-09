import 'package:flutter/material.dart';
class input_field extends StatelessWidget {
  final String name;
  String ?txt, label_txt;
  double height = 52, btm_padding = 0;
  input_field({Key? key, required this.name, this.txt}) : super(key: key);
  Widget? MyIcon (BuildContext context){
    return null;
}
  @override
  Widget build(BuildContext context) {
    // Contain the field with its name
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold ,
            ),
          ),
          Container(
            // Contain the box and text field
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(bottom: btm_padding),
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Row(
              children:  [
                Expanded(child: TextField(
                  controller: TextEditingController(), //reading the user input
                  readOnly: name=="Date"??true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // label will never float
                    hintText: txt,
                    labelText: label_txt,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.blue[700],

                    ),
                    labelStyle: TextStyle(
                      color: Colors.blue[700],
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    suffixIcon: MyIcon(context),
                  ),
                  maxLines: null,

                ))

              ],
            ),
          )
        ],
      ),
    );
  }
}
