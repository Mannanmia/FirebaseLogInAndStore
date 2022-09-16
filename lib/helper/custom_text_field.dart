import 'package:firebase_app/utils/all_string.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String fieldValue;
  String errorMsg1;
  TextInputType keyBoardType;
  String lebelText;
  String hintText;
  IconData icon;
  CustomTextField({Key? key,
    required this.icon,
  required this.controller,
  required this.errorMsg1,
  required this.keyBoardType,
  required this.hintText,
  required this.lebelText,
    required this.fieldValue,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
AllColor allColor=AllColor();
AllIcon allIcon=AllIcon();
bool  showPassoff=true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: widget.keyBoardType,
      controller:widget.controller,
      validator: (value){
        if(value==null || value.isEmpty){
          return 'This field can not be empty';
        }else if(widget.lebelText=="Password"||widget.lebelText=="Confirm Password")
          {
               if(value.length<6){
                 return "password should be atleast 6 characters";
               }
          }
        return null;
      },
      cursorColor: allColor.cursorColor,
      decoration: InputDecoration(
        labelText: widget.lebelText,
        labelStyle: TextStyle(
          color:allColor.textColor,
        ),
        hintStyle: TextStyle(
          color: allColor.textColor,
        ),
        hintText:widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width:3,
          ),
          borderRadius:BorderRadius.only(topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: allColor.textColor,
          ),
          borderRadius:BorderRadius.only(topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        suffixIcon: Icon(widget.icon,color: Colors.black,),

      ),
    );
  }
}
