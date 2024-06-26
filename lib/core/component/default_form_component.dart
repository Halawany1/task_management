
//formfield
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BuildDefaultFormField extends StatelessWidget {
  const BuildDefaultFormField({super.key,
    required this.controller,
    required this.type,
    this.validator,
    this.hinttext,
    required this.labeltext,
    this.prefix,
    this.pass=false,
    this.suf=false,
    this.suffeix,
    this.suffix1,
    this.suffix2,
    this.obscureText=false,
    this.ontap,
    this.width});

  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String>? validator;
  final String? hinttext;
  final String labeltext;
  final IconData? prefix;
  final bool pass;
  final bool suf;
  final VoidCallback? suffeix;
  final IconData? suffix1;
  final IconData? suffix2;
  final bool obscureText;
  final VoidCallback? ontap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child:  TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validator,
        obscureText: obscureText,
        onTap: ontap,
        decoration: InputDecoration(
            prefixIcon: Icon(prefix),
            suffixIcon:suf? IconButton(
              onPressed: suffeix,
              icon: (!pass)?const Icon(Icons.visibility):const Icon(Icons.visibility_off,),):null,
            labelText: labeltext,
            hintText: hinttext,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),


      ),
    );
  }
}

