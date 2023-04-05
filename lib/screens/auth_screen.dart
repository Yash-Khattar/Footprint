import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footprint/const.dart';
import 'package:footprint/providers/googleSignIn_provider.dart';
import 'package:footprint/reusable_widgets/button.dart';
// import 'package:footprint/screens/bottom_nav.dart';
import 'package:provider/provider.dart';

bool isLogin = true;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  static String id = "AuthPage";
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void toggle() {
    // print(isLogin);
    setState(() {
      isLogin = !isLogin;
    });
    // print(isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return SignUp(toggle);
  }
}

class SignUp extends StatefulWidget {
  final VoidCallback onClickSignUp;
  SignUp(this.onClickSignUp);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _conPassController = TextEditingController();
  bool _passwordVisible = false;
  bool _conPasswordVisible = false;
  String error_message = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Future<void> showErrorDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: ListView(
              shrinkWrap: true,
              children: [
                // const SizedBox(
                //   height: 60,
                // ),
                CircleAvatar(
                  radius: 80,
                  child: Image.asset("assets/logo.png", fit: BoxFit.fill),
                ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   decoration: const BoxDecoration(shape: BoxShape.circle),
                //   child: ClipRRect(
                //       child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                //       borderRadius: BorderRadius.circular(200),
                //       clipBehavior: Clip.hardEdge),
                // ),

                const SizedBox(
                  height: 40,
                ),
                isLogin
                    ? const SizedBox(
                        height: 0,
                      )
                    : TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: kOutlineInputBorder,
                          hintText: "Name",
                          contentPadding: EdgeInsets.all(5),
                          prefixIcon: Icon(Icons.person),
                          // errorText: "Required field",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                isLogin
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: kOutlineInputBorder,
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(Icons.email_rounded),
                    // errorText: "Required field",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      obscureText: !_passwordVisible,
                      controller: _passController,
                      decoration: const InputDecoration(
                        border: kOutlineInputBorder,
                        // errorText: "Required field",
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(5),
                        prefixIcon: Icon(Icons.key_sharp),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                isLogin
                    ? const SizedBox(
                        height: 0,
                      )
                    : Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            // validator: (value) {
                            //   if (value != _passController.text) {
                            //     setState(() {
                            //       error_message =
                            //           "Confirm password and password should be same.";
                            //     });
                            //     return "hi";
                            //   }
                            // },
                            obscureText: !_conPasswordVisible,
                            controller: _conPassController,
                            decoration: const InputDecoration(
                              border: kOutlineInputBorder,
                              // errorText: "Required field",
                              hintText: "Confirm Password",
                              contentPadding: EdgeInsets.all(5),
                              prefixIcon: Icon(Icons.key_sharp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  _conPasswordVisible = !_conPasswordVisible;
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                _conPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                isLogin
                    ? const SizedBox(
                        height: 0,
                      )
                    : const SizedBox(
                        height: 20,
                      ),
                PrimaryButton(
                  text: isLogin ? "Login" : "Sign Up",
                  onpressed: isLogin ? signIn : SignUp,
                  color: kgreyColor,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: kgreyColor,
                //   ),
                //   clipBehavior: Clip.hardEdge,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: isLogin ? signIn : SignUp,
                //     style: const ButtonStyle(
                //       alignment: Alignment.center,
                //       backgroundColor: MaterialStatePropertyAll(kgreyColor),
                //       padding: MaterialStatePropertyAll(
                //         EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                //       ),
                //       // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)))),
                //     ),
                //     child: isLogin ? Text("Login") : Text("Sign Up"),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLogin
                        ? Text("New User?")
                        : Text("Already have an accout?"),
                    TextButton(
                      onPressed: widget.onClickSignUp,
                      child: isLogin
                          ? Text("Sign Up")
                          : Text(
                              "Sign In",
                            ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: kgreyColor,
                      height: 1,
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR"),
                    ),
                    Container(
                      color: kgreyColor,
                      height: 1,
                      width: 120,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GoogleButton(
                    text: "Continue with Google",
                    onpressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      // Navigator.pushNamed(context, BottomNavigation.id);
                    },
                    icon: FontAwesomeIcons.google),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: kgreyColor,
                //   ),
                //   clipBehavior: Clip.hardEdge,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () => null,
                //     style: const ButtonStyle(
                //       alignment: Alignment.center,
                //       backgroundColor: MaterialStatePropertyAll(kgreyColor),
                //       padding: MaterialStatePropertyAll(
                //         EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                //       ),
                //       // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)))),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: const [
                //         Text(
                //           "Continue with Google",
                //           textAlign: TextAlign.center,
                //         ),
                //         Icon(Icons.arrow_forward)
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
      // Navigator.pushNamed(context, BottomNavigation.id);
    } on FirebaseAuthException catch (error) {
      setState(() {
        print(error.code);
        switch (error.code) {
          case 'user-not-found':
            error_message = 'No user found. Try signing up.';
            break;
          case 'wrong-password':
            error_message = 'Wrong password.';
            break;
          case 'invalid-email':
            error_message = 'The email address is invalid.';
            break;
          case 'user-disabled':
            error_message = 'This account has been disabled.';
            break;
          default:
            error_message = 'An error occured. Please try again later.';
        }
        showErrorDialog(context, error_message);
      });
    }
  }

  Future<void> SignUp() async {
    try {
      if (_passController.text != _conPassController.text) {
        showErrorDialog(
            context, "Confirm password and password should be same.");
      } else if (_nameController.text == "") {
        showErrorDialog(context, "Please enter your name.");
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim(),
        );
        // Navigator.pushNamed(context, BottomNavigation.id);
      }
    } on FirebaseAuthException catch (error) {
      setState(
        () {
          print(error.code);
          if (error.code == 'weak-password') {
            error_message = 'The password provided is too weak.';
          } else if (error.code == 'email-already-in-use') {
            error_message = 'The account already exists for that email.';
          } else if (error.code == "invalid-email") {
            error_message = 'Please enter a proper e-mail address.';
          } else {
            error_message = 'An error occured. Please try again later.';
          }
          showErrorDialog(context, error_message);
        },
      );
    }
  }
}
