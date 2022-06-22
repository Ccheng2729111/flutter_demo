import 'package:flutter/material.dart';

import 'CommonAppBar.dart';

class RowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'row and column Demo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [rowBuild(context), columnBuild(context)],
        ),
      ),
    );
  }

  Widget rowBuild(BuildContext context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.start, //主轴排列方式
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //主轴排列方式
          children: itemBuild(context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: itemBuild(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: itemBuild(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: itemBuild(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: itemBuild(context),
          ),
        )
      ],
    ));
  }

  Widget columnBuild(BuildContext context) {
    return (Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: itemBuild(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: itemBuild(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemBuild(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: itemBuild(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: itemBuild(context),
            ),
          )
        ],
      ),
    ));
  }

  List<Container> itemBuild(BuildContext context) {
    return ([
      Container(
        color: Colors.yellow,
        width: 60,
        height: 80,
      ),
      Container(
        color: Colors.red,
        width: 60,
        height: 80,
      ),
      Container(
        color: Colors.black,
        width: 60,
        height: 80,
      ),
      Container(
        color: Colors.green,
        width: 60,
        height: 80,
      )
    ]);
  }
}
