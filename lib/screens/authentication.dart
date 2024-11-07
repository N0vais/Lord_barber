import 'package:barber_lord_definitivo/components/butomSocial.dart';
import 'package:barber_lord_definitivo/components/form_login.dart';
import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:barber_lord_definitivo/utils/text.dart';
import 'package:flutter/material.dart';

class AutenticationPage extends StatefulWidget {
  const AutenticationPage({Key? key}) : super(key: key);

  @override
  State<AutenticationPage> createState() => _AutenticationPage();
}

class _AutenticationPage extends State<AutenticationPage> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppText.enText['welcome_text']!,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Text(
            isSignIn
                ? AppText.enText['signIn_text']!
                : AppText.enText['register_text']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Config.spaceSmall,

          //adicionando o widget do formulario
          const FormLogin(),

          Config.spaceSmall,
          //       isSignIn
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppText.enText['forgot-password']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          //           : Container(),
                 const Spacer(),
                 Center(
                   child: Text(
                     AppText.enText['social-login']!,
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.normal,
                       color: Colors.black12,
                     ),
                   ),
                 ),
                 Config.spaceSmall,
                  const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     ButomSocial(social: 'google'),
                     ButomSocial(social: 'facebook'),
                   ],
                  ),
                 Config.spaceSmall,
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                 Text(
                 isSignIn
                 ? AppText.enText['signUp_text']!
                     : AppText.enText['registered_text']!,

                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.normal,
                     color: Colors.black,
                   ),
                 ),
                     TextButton(
                       onPressed: () {
                         setState(() {
                           isSignIn = !isSignIn;
                         });
                       },
                       child: Text(
                         isSignIn ? 'Sign Up' : 'Sign In',
                         style: const TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.black,
                         ),
                       ),
                     )
                   ],
                 )
        ],
      )),
    ));
  }
}
