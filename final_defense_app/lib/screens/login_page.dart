import 'package:final_defense_app/screens/generate_key_pair.dart';
import 'package:final_defense_app/screens/registration_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget with ValidationMixin {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Use your work email to login",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontFamily: "SFPro"),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Email",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: "SFPro"),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                validator: (email) {
                  if (widget.isEmailValid(email!)) {
                    return null;
                  } else
                    return 'Enter a valid email address';
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xffACACAC),
                        fontFamily: "SFPro")),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: "SFPro"),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isObscureText,
                validator: (password) {
                  if (widget.isPasswordValid(password!)) {
                    return null;
                  } else {
                    return 'Enter a valid password';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE1E1E1)),
                        borderRadius: BorderRadius.circular(8)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          });
                        },
                        icon: isObscureText == true
                            ? Icon(Icons.visibility_off_rounded)
                            : Image.asset("images/eye.png"),
                        color: Colors.grey),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xffACACAC),
                        fontFamily: "SFPro")),
              ),
              Spacer(),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff0078D4)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GenerateKeyPair()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "SFPro"),
                      ),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    side: MaterialStatePropertyAll(BorderSide(
                      color: Color(0xffC7E0F4),
                      width: 1,
                    )),
                  ),
                  //Sign UP Button navigator
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 116),
                    child: Center(
                      child: Text(
                        "Don???t have an account? Signup",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff0078D4),
                            fontFamily: "SFPro"),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  bool isObscureText = true;
}

mixin ValidationMixin {
  bool isPasswordValid(String password) => password.length >= 4;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
