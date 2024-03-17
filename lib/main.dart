import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const portfolio(),
    );
  }
}

class portfolio extends StatefulWidget {
  const portfolio({super.key});

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio> {
  Color topColor = Colors.deepPurple;
  Color bottomColor = Colors.purple;

  var ColorList = [
    Colors.pink,
    Colors.amber,
    Colors.purple,
    Colors.deepPurple,
    Colors.blue,
    Colors.blueAccent,
    Colors.indigo,
    Colors.indigoAccent,
  ];
  var index = 0;
  late Uri link;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        bottomColor = Colors.transparent;
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            onEnd: () {
              setState(() {
                index++;
                bottomColor = ColorList[index % ColorList.length];
                topColor = ColorList[(index + 1) % ColorList.length];
              });
            },
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  topColor,
                  bottomColor,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://cdn.pixabay.com/photo/2013/07/13/09/38/sphere-155819__340.png",
                    width: 100),
                const Text(
                  "AnasSoftEng",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Developer | Trader | Youtuber | SMM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          link = Uri.parse("https://facebook.com/malixaa");
                          if (await canLaunchUrl(link)) {
                            launchUrl(link);
                          }
                        },
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.linked_camera,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.youtube_searched_for,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.telegram,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
