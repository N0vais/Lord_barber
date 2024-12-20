import 'package:barber_lord_definitivo/main.dart';
import 'package:barber_lord_definitivo/models/model_autentication.dart';
import 'package:barber_lord_definitivo/provider/dio_provider.dart';
import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'butomLogin.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black87,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Butomlogin(
                width: double.infinity,
                title: 'Entrar',
                onPressed: () async{
                  final token = await DioProvider()
                      .getToken(_emailController.text, _passController.text);
                  final user = await DioProvider().getUser(token);
                  print(user);
                  // Navigator.of(context).pushNamed('main');
                },
                disable: false,
              ),


          // Consumer<AuthModel>(
          //   builder: (context, auth, child) {
          //     return Button(
          //       width: double.infinity,
          //       title: 'Sign In',
          //       onPressed: () async {
          //         //login here
          //         final token = await DioProvider()
          //             .getToken(_emailController.text, _passController.text);
          //
          //         if (token) {
          //           //auth.loginSuccess(); //update login status
          //           //rediret to main page
          //
          //           //grab user data here
          //           final SharedPreferences prefs =
          //           await SharedPreferences.getInstance();
          //           final tokenValue = prefs.getString('token') ?? '';
          //
          //           if (tokenValue.isNotEmpty && tokenValue != '') {
          //             //get user data
          //             final response = await DioProvider().getUser(tokenValue);
          //             if (response != null) {
          //               setState(() {
          //                 //json decode
          //                 Map<String, dynamic> appointment = {};
          //                 final user = json.decode(response);
          //
          //                 //check if any appointment today
          //                 for (var doctorData in user['doctor']) {
          //                   //if there is appointment return for today
          //
          //                   if (doctorData['appointments'] != null) {
          //                     appointment = doctorData;
          //                   }
          //                 }
          //
          //                 //auth.loginSuccess(user, appointment);
          //                 // MyApp.navigatorKey.currentState!.pushNamed('main');
          //               });
          //             }
          //           }
          //         }
          //       },
          //       disable: false,
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
