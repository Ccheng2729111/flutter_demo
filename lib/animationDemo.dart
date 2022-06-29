import 'package:flutter/material.dart';
import 'package:zeeker_flutter_demo/CommonAppBar.dart';

import './CommonAppBar.dart';

class AnimateApp extends StatefulWidget {
  const AnimateApp({Key? key}) : super(key: key);

  @override
  State<AnimateApp> createState() => _AnimateAppState();
}

class _AnimateAppState extends State<AnimateApp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
        vsync: this,
        duration:
            const Duration(milliseconds: 1000)); //当widget不显示的时候 动画停止 显示的时候动画启动
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticIn);
    //创建一个50-200 跟随震荡曲线变化的animation
    animation = Tween(begin: 50.0, end: 200.0).animate(curve);
    // ..addListener(() {
    //   setState(() {}); //刷新界面
    // });
    controller.repeat(reverse: true); //启动动画 并且重复loop
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose(); //controller销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CommonAppBar(
          title: 'flutter demo',
          isHome: true,
        ),
      ),
      body: Center(
        // child: Container(
        //   width: animation.value, //动画宽高赋值给container
        //   height: animation.value,
        //   child: FlutterLogo(),
        // ),
        // child: Container(
        //   child: AnimationLogo(
        //     animation: animation,
        //   ),
        // ),
        child: AnimatedBuilder(
          //可以使用builder 将animation和builder分离
          animation: animation,
          child: FlutterLogo(),
          builder: (context, child) => Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        ),
      ),
    ));
  }
}

//利用AnimationWidget特性 接受animation参数 不用手动去addListener 然后每次都去手动setState刷新页面
class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        child: FlutterLogo(),
      ),
    ));
  }
}
