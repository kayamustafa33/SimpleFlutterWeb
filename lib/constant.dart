import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

var whiteTextColor = TextStyle(color: Colors.white);
var blueTextColor =TextStyle(color: Colors.blue);

Widget customCard(String url,String projectName){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Expanded(
            child: Card(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 20,color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () => launch(url),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('images/github_logo.png'),
                      width: 200,
                      height: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        projectName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}