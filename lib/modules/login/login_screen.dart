import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController= TextEditingController();

  var passController= TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(

          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value)
                  {
                    if(value!.isEmpty){
                      return('email address must not be empty');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isPassword ,
                  decoration: InputDecoration(
                    labelText: 'Password',

                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                     icon: Icon(Icons.remove_red_eye),
                      onPressed: (){
                       setState(() {
                         isPassword=!isPassword;
                       });

                      },


                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: ( value)
                  {
                    if(value!.isEmpty){
                      return( 'password must not be empty');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                  width: double.infinity,
                  text: 'login',
                  background: Colors.red,
                  function: (){
                    print(emailController.text);
                    print(passController.text);
                  },

                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                    ),
                    TextButton(onPressed:(){},
                        child:
                        Text(
                          'Register Now',
                        ),
                    )
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
