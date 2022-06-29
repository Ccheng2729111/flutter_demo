import 'package:flutter/material.dart';

class HeroPage1 extends StatelessWidget {
  const HeroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: 'hero', //定义同一个tag
          child: Container(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Page2()));
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'hero', //定义同一个tag
        child: Container(
          width: 300,
          height: 300,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
