import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../services/firebase_services.dart';
import 'widgets/auth_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  showSnackBar(String error) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(error),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Let's sign in.",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome back.\nYou've been missed!",
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Form(
                    key: signInFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthTextField(
                            usernameController: usernameController,
                            hintText: 'Username',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthTextField(
                            usernameController: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {

                                if (signInFormKey.currentState!.validate()) {
                                  setState((){
                                    isLoading = true;
                                  });
                                  FirebaseServices().login(
                                      usernameController.text.trim(),
                                      passwordController.text.trim())
                                      .then(
                                          (value) {
                                        if(value != true){
                                          setState((){
                                            isLoading = false;
                                          });
                                          showSnackBar(value.toString());
                                          return;
                                        } else {
                                          setState((){
                                            isLoading = false;
                                          });
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                              const HomeScreen(),
                                            ),
                                                (route) => false,
                                          );
                                        }
                                      }
                                  );
                                }
                              },
                              child: isLoading? const CircularProgressIndicator(color: Colors.white): const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
