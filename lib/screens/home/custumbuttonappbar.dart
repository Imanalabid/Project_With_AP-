import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class CustumButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  CustumButtonAppBar({
    super.key,
    required this.textbutton,
    required this.icondata,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(children: [
        Icon(
          icondata,
        ),
        Text(
          textbutton,
        )
      ]),
    );
  }
}
