import 'package:flutter/material.dart';

void navigatePage(BuildContext context, Widget pageName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
  );
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.icon,
      required this.hint,
      this.obsecure = false,
      required this.validator,
      required this.onSaved,
      this.checking,
      this.moveEyes});

  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  VoidCallback? checking;
  void Function(dynamic)? moveEyes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        onChanged: (value) => moveEyes ??= null,
        onTap: () => checking ??= null,
        onSaved: onSaved,
        validator: validator,
        autofocus: true,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }
}

Widget filledButton(String text, Color splashColor, Color highlightColor,
    Color fillColor, Color textColor, void function()) {
  return MaterialButton(
    highlightElevation: 0.0,
    splashColor: splashColor,
    highlightColor: highlightColor,
    elevation: 0.0,
    color: fillColor,
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
    ),
    onPressed: () {
      function();
    },
  );
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Lütfen bir Şifre giriniz';
  }
  if (value.length < 8) {
    return "Şifre 8 karakterden düşük olamaz";
  }
  if (value == "") return "Lütfen bir şifre sağlayın";
  if (!value.contains(RegExp(r'[a-zA-Z]'))) {
    return "Şifrende en az bir büyük harf ve bir küçük harfe sahip olmalıdır";
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Şifrende en az bir tane sayı olması gerekmektedir";
  }
  return null;
}

String? validateEmailAddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  } else {
    return null;
  }
}

String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return "Lütfen bir isim sağlayın";
  } else {
    return null;
  }
}
