import 'package:flutter/material.dart';

class LogoEsquina extends StatelessWidget {
  const LogoEsquina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logoEsquina.png',
      width: 141,
      height: 129,
    );
  }
}
