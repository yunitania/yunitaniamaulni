import 'package:flutter/material.dart';

class UserData {
  String? fname;
  String? lname;
  String? email;
  String? password;
  UserData({this.fname, this.lname, this.email, this.password});
}

class ExtrctScaffold extends StatelessWidget {
  const ExtrctScaffold({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing Data"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
        centerTitle: true,
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  dataNavigation(BuildContext context) {
    UserData user = new UserData(
        fname: firstNameController.text,
        lname: lastNameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Form Validated");
      // _signupFormKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(user: user),
        ),
      );
    } else {
      print("Form Not Validated");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Masukkan Nama Depan",
                ),
                controller: firstNameController,
                validator: (String? value) {
                  if (value == null || value.trim().length == 0) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Masukkan Nama Belakang",
                ),
                controller: lastNameController,
                validator: (String? value) {
                  if (value == null || value.trim().length == 0) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Masukkan Email",
                  ),
                  controller: emailController,
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "Please Enter your Email";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        .hasMatch(value)) {
                      return "please Enter the valid email address";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Masukkan Password",
                ),
                controller: passwordController,
                validator: (String? value) {
                  if (value == null || value.trim().length == 0) {
                    return "Please Enter your Password";
                  }
                  if (value.length <= 6) {
                    return "Password length shoul be > 6";
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  dataNavigation(context);
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final UserData user;
  HomeScreen({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("First Name: ${user.fname}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Last Name: ${user.lname}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Email: ${user.email}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Password: ${user.password}"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go Back"))
            ],
          ),
        ),
      ),
    );
  }
}
