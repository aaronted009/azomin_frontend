import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _page(),
    );
  }

  Widget _page() {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xffF2CECF),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("images/school-icon.png"),
                            width: 24, // Adjust the width as needed
                            height: 24, // Adjust the height as needed
                          ),
                          SizedBox(
                              width:
                                  8), // Add some spacing between the icon and text
                          Text(
                            "AZOMIN",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(
                          bottom: 200), // Adjust the margin as needed
                      child: Image(
                        image: AssetImage("images/login.png"),
                        width: 300, // Adjust the width as needed
                        height: 300, // Adjust the height as needed
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
          child: Container(
              color: Color(0xffFFFFFF),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      "Log in",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username or Email",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          minimumSize:
                              Size(double.infinity, 50), // Set the height
                        ),
                        child: const Text("Enter",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  )
                ],
              )))
    ]);
  }
}
