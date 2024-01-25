import "package:fb_auth_bloc/blocs/signup/signup_cubit.dart";
import "package:fb_auth_bloc/pages/signin_page.dart";
import "package:fb_auth_bloc/utils/error_dialog.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:validators/validators.dart";

class SignupPage extends StatefulWidget {
  static const String routeName = "/signup";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();
  String? _email, _password, _name;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save(); //trigger onsaved of all inputs
    print("$_email $_password $_name");
    context
        .read<SignupCubit>()
        .signup(password: _password!, email: _email!, name: _name!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.signupStatus == SignupStatus.error) {
            errorDialog(context, state.customError);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autovalidateMode,
                  child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    children: [
                      Image.asset(
                        "assets/images/flutter_logo.png",
                        width: 250,
                        height: 250,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (String? inputName) {
                          if (inputName!.isEmpty) {
                            return "Enter a valid name";
                          } else if (inputName.length < 5) {
                            return "Enter a name with more than 5 chars";
                          }
                          return null;
                        },
                        onSaved: (String? inputValue) {
                          _name = inputValue;
                        },
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (String? inputEmail) {
                          if (inputEmail!.trim().isEmpty) {
                            return "Set Email";
                          } else if (!isEmail(inputEmail.trim())) {
                            return "Enter a valid email";
                          }

                          return null;
                        },
                        onSaved: (String? inputValue) {
                          _email = inputValue;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (String? inputPassword) {
                          if (inputPassword!.length < 5) {
                            return "Password needs to be greater than 5 chars";
                          } else if (inputPassword.trim().isEmpty) {
                            return "Enter a Password";
                          }
                          return null;
                        },
                        onSaved: (String? inputValue) {
                          _password = inputValue;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (String? inputPassword) {
                          if (_passwordController.text != inputPassword) {
                            return 'Passwords not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _submit();
                        },
                        child: Opacity(
                          opacity: state.signupStatus == SignupStatus.submitting
                              ? 0.5
                              : 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("Sign Up"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInPage.routeName);
                        },
                        child: const Text(
                          "Already have an account?Sign in!",
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ].reversed.toList(),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
