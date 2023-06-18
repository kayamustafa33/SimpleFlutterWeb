import 'package:flutter/material.dart';
import 'package:portfolioapp/constant.dart';
import 'package:portfolioapp/contactme.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}
_launchURLBrowser() async {
  const url = 'https://github.com/kayamustafa33/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class _MainPageState extends State<MainPage> {

  bool hoveringHome = false;
  bool hoveringContact = false;
  bool hoveringGithub = false;

  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Scaffold(
          appBar : AppBar(
            backgroundColor: Colors.black87,
            leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MainPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  child: Center(
                    child: Text('KAYA'),
                  ),
                ),
              ),
            ), // Logo solda görünecek
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15.0, top: 8.0, bottom: 8.0),
                child: TextButton(
                  onHover: (value) {
                    setState(() {
                      hoveringHome = value;
                    });
                  },
                  onPressed: () {

                    // Portfolio butonuna basıldığında yapılacak işlemler
                  },
                  child: Text('Home',
                    style: hoveringHome ? blueTextColor : whiteTextColor,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                child: TextButton(
                  onHover: (value) {
                    setState(() {
                      hoveringContact = value;
                    });
                  },
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactMe()),
                    );

                  },
                  child: Text('Contact Me',
                    style: hoveringContact ? blueTextColor : whiteTextColor,
                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(right: 15.0, top: 8.0, bottom: 8.0),
                child: ElevatedButton(
                    onPressed: () => launch('https://github.com/kayamustafa33'),
                  onHover: (value) {
                      setState(() {
                        hoveringGithub = value;
                      });
                  },
                    style: ElevatedButton.styleFrom(
                      shape:  StadiumBorder(),
                      primary: hoveringGithub ? Colors.red : Colors.blue,
                    ),
                  child:  Text(
                  "My Github Page"
                ),
                ),
              ),
            ],
          ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg_image.jpg"), // resim dosyasının yolu
                fit: BoxFit.cover, // resmi sığdırma yöntemi
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.5,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'images/android.jpg',
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                           Expanded(
                             child: Padding(
                               padding: const EdgeInsets.only(top: 200.0, left: 50.0),
                               child: Column(
                                 children: const [
                                   Text(
                                     "I'm Mustafa Kaya",style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 50.0,
                                       color: Colors.white,
                                   ),
                                   ),
                                   Text(
                                     "Android Developer",
                                     style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 25.0,
                                       color: Colors.white,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50.0, left: 40.0),
                      child: Text(
                        "My Skills:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0,left: 40.0),
                      child: Text(
                        "Java, Kotlin, C/C++, C#, HTML ,CSS, Penetration Testing, Flutter, SQL",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 30.0,top: 30.0),
                  child: Center(
                    child: Text(
                      "Portfolio",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customCard('https://github.com/kayamustafa33/Student-Teacher-Management-App', "Student-Teacher Management App"),
                      customCard('https://github.com/kayamustafa33/Social-Media-Android-App', "Social Media Android App"),
                      customCard('https://github.com/kayamustafa33/Clinic-Appointment-System-Android-Java', "Clinic Appointment System"),
                      customCard('https://github.com/kayamustafa33/Password-Manager-Android-App', "Password Manager Android App"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customCard('https://github.com/kayamustafa33/ToDoList-Android-', "To Do List Android App"),
                    customCard('https://github.com/kayamustafa33/WheaterApp-Android-Java-', "Weather Android App"),
                    customCard('https://github.com/kayamustafa33/HotelManagementSystem-Android-Java-', "Hotel Management System"),
                    customCard('https://github.com/kayamustafa33/KeyLogger', "Key Logger"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customCard('https://github.com/kayamustafa33/Simple-Music-Player-App', "Music Player Android App"),
                    customCard('https://github.com/kayamustafa33/NFC-Card-Id-Reader', "NFC Card Reader Android App"),
                    customCard('https://github.com/kayamustafa33/Message-App', "Message Android App"),
                    customCard('https://github.com/kayamustafa33/Final-Form', "Final Form Android App"),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  height: 40,
                  color: Colors.black87,
                  alignment: Alignment.center,
                  child: Text(
                    'All rights reserved by Mustafa Kaya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

