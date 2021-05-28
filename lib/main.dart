import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_view_details.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));

class LoginPage extends StatelessWidget {
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Forgot Password?'),
            content: TextField(
              decoration: InputDecoration(hintText: 'Enter emaid id...'),
              controller: customController,
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  //Navigator.of(context).pop(customController.text.toString());
                  Navigator.of(context).pop();
                  final ScaffoldMessengerState scaffoldMessenger =
                      ScaffoldMessenger.of(context);
                  scaffoldMessenger.showSnackBar(const SnackBar(
                      content: Text('Email to reset password sent.')));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login App',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Login here.',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontFamily: 'Oswald',
                    fontSize: 38,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email Id',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  createAlertDialog(context);
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    ' - - - - - - - - ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    ' - - - - - - - - ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              margin: EdgeInsets.only(top: 55.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.person_pin),
                label: Text(
                  'Sign In With Google',
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              margin: EdgeInsets.only(top: 90.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewPage()),
                  );
                },
                child: Text(
                  'ListView (Practice)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login App',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'SignUp here.',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontFamily: 'Oswald',
                    fontSize: 38,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter username...',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter email id...',
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email Id',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter password...',
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter phone number...',
                  prefixIcon: Icon(
                    Icons.phone_android,
                  ),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              margin: EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView (Practice)',
        ),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: Text(
                ''
                'List Item Index Number is $index',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
              subtitle: Text('Testing listview'),
              leading: IconButton(
                icon: new Icon(
                  Icons.circle,
                  color: Colors.amber,
                ),
                onPressed: () {
                },
              ),
              trailing: IconButton(
                icon: new Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.amber,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(index)),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
