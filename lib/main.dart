import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Calculator and Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const SignInScreen(),
    const SignUpScreen(),
    const CalculatorScreen(),
  ];

  void _onDrawerItemTapped(int index) {
    Navigator.pop(context); // Close the drawer
    _navigateToScreen(index);
  }

  void _navigateToScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Calculator and Authentication'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Custom drawer header color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Sign In'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Sign Up'),
              onTap: () => _onDrawerItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              onTap: () => _onDrawerItemTapped(2),
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _navigateToScreen(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    void _signIn() {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // You can add authentication logic here
      if (username.isNotEmpty && password.isNotEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sign In"),
              content: const Text("Sign In Successful"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.deepPurple, // Custom app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                // Removed icon from here
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                // Removed icon from here
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple), // Custom button color
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    String _gender = 'Male';
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    void _signUp() {
      String name = _nameController.text;
      String gender = _gender;
      String phone = _phoneController.text;
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // You can add signup logic here
      if (name.isNotEmpty &&
          gender.isNotEmpty &&
          phone.isNotEmpty &&
          password.isNotEmpty &&
          password == confirmPassword) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sign Up"),
              content: const Text("Sign Up Successful"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.deepPurple, // Custom app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  // Removed icon from here
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Male', 'Female', 'Other']
                    .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
                    .toList(),
                onChanged: (value) {
                  _gender = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  // Removed icon from here
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  // Removed icon from here
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  // Removed icon from here
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  // Removed icon from here
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple), // Custom button color
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "0";
  String _operand = "";
  double num1 = 0;
  double num2 = 0;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _result = "0";
      _operand = "";
      num1 = 0;
      num2 = 0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(_output);
      _operand = buttonText;
      _result = "0";
    } else if (buttonText == ".") {
      if (!_result.contains(".")) {
        _result += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      if (_operand == "+") {
        _result = (num1 + num2).toString();
      }

      if (_operand == "-") {
        _result = (num1 - num2).toString();
      }

      if (_operand == "*") {
        _result = (num1 * num2).toString();
      }

      if (_operand == "/") {
        _result = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      _operand = "";
    } else {
      _result += buttonText;
    }

    setState(() {
      _output = double.parse(_result).toStringAsFixed(2);
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor,
      double buttonHeight) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              buttonColor), // Custom button color
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.deepPurple, // Custom app bar color
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.grey, 1),
                  _buildButton("8", Colors.grey, 1),
                  _buildButton("9", Colors.grey, 1),
                  _buildButton("/", Colors.deepPurple, 1),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.grey, 1),
                  _buildButton("5", Colors.grey, 1),
                  _buildButton("6", Colors.grey, 1),
                  _buildButton("*", Colors.deepPurple, 1),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.grey, 1),
                  _buildButton("2", Colors.grey, 1),
                  _buildButton("3", Colors.grey, 1),
                  _buildButton("-", Colors.deepPurple, 1),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton(".", Colors.grey, 1),
                  _buildButton("0", Colors.grey, 1),
                  _buildButton("00", Colors.grey, 1),
                  _buildButton("+", Colors.deepPurple, 1),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.red, 1),
                  _buildButton("=", Colors.green, 1),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}