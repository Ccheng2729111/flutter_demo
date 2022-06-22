import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('您访问的页面不存在'),
            RaisedButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text('返回'),
            )
          ],
        ),
      ),
    );
  }
}
