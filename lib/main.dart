import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final _emailFormController = TextEditingController();
  final  _passwordFormController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = true;

  bool validateEmail(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
    return emailValid;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page",style: TextStyle(color: Colors.blue)),
      elevation: 0,
      //titleSpacing: 3,
        leading: IconButton(
          icon: const Icon(Icons.menu,color: Colors.cyan,),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailFormController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                    return 'Required field is empty';
                    }

                    if(validateEmail(value)== false){
                      return 'Invalid email';
                    }
                    return null;
                    }

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordFormController,
                  keyboardType: TextInputType.phone,
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      suffixIcon: IconButton(onPressed: ()
                      {
                        if(mounted) {
                          _isVisible = !_isVisible;
                          setState(() {
                          });
                        }
                      },
                          icon: _isVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility,),
                  ),
                  ),
                      
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field is empty';
                    }
                    if (value.length < 8) {
                      return 'The password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()){

                        }
                      }, child: const Text("Login")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}


