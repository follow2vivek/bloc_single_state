import 'package:flutter/material.dart';

typedef OnTap = void Function();

class AppButton extends StatelessWidget {
  final String text;
  final OnTap onTap;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
        fixedSize: WidgetStateProperty.all(Size(180, 50)),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          : Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
