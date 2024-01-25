import "package:fb_auth_bloc/blocs/sigin/signin_cubit.dart";
import "package:fb_auth_bloc/pages/signup_page.dart";
import "package:fb_auth_bloc/utils/error_dialog.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:validators/validators.dart";

class SignInPage extends StatefulWidget {
  static const String routeName = "/signin";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); //key for the form
  AutovalidateMode _autovalidateMode =
      AutovalidateMode.disabled; // validate functions for the form
  //disabled because validation will not be performed until the form is submitted
  String? _password, _email;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    print("$_password $_email");

    context.read<SignInCubit>().signin(email: _email!, password: _password!);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<SignInCubit, SigninState>(
          listener: (context, state) {
            if (state.signinStatus == SigninStatus.error) {
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
                    shrinkWrap: true,
                    children: [
                      Image.asset(
                        'assets/images/flutter_logo.png',
                        width: 250,
                        height: 250,
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
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (String? emailInput) {
                          if (emailInput == null ||
                              emailInput!.trim().isEmpty) {
                            return "Email required";
                          } else if (!isEmail(emailInput.trim())) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _email = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            labelText: "Password"),
                        validator: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'Password Required';
                          } else if (value.trim().length < 5) {
                            return 'Password needs to be more than 5 chars';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _password = value;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          state.signinStatus == SigninStatus.submitting
                              ? null
                              : _submit();
                        },
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor:
                        //         state.signinStatus == SigninStatus.submitting
                        //             ? Colors.white30
                        //             : Colors.blue),
                        child: Opacity(
                          opacity: state.signinStatus == SigninStatus.submitting
                              ? 0.5
                              : 1.0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        onPressed: isLoading ? null :() {
                          state.signinStatus == SigninStatus.submitting
                              ? null
                              : Navigator.pushNamed(
                                  context, SignupPage.routeName);
                        },
                        child: Text(
                          "Not a Member? Sign Up!",
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
