import 'package:codepie/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences preferences;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFF2ecbf2)), // Couleur de fond du bouton
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white), // Couleur du texte
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      'Welcome to Home Screen',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  /*Text(
                    'user_id: ${preferences.getInt('user_id').toString()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Name: ${preferences.getString('name').toString()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'email: ${preferences.getString('email').toString()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'token: ${preferences.getString('token').toString()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                ],
              ),
      ),
    );
  }
}
