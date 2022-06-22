import 'package:flutter/material.dart';
import 'CommonAppBar.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'Row And Column Demo',
        ),
      ),
      body: ListView.separated(
        //listview.seprated可以创建带下划线的滚动列表
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1.0),
        itemCount: 4, //当前显示的列表数量
        itemBuilder: (context, index) {
          return UpdatedItemWidget(
            //抽离生成item的widget
            model: UpdatedItemModel(
                appIcon: "assets/icon.png",
                appDescription:
                    "Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                appName: "Google Maps - Transit & Fond",
                appSize: "137.2",
                appVersion: "Version 5.19",
                appDate: "2019年6月5日"),
            onPressed: () {},
          );
        },
      ),
    );
  }
}

//定义当前updateItem的props的数据class
class UpdatedItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;
  UpdatedItemModel(
      {required this.appIcon,
      required this.appName,
      required this.appSize,
      required this.appDate,
      required this.appDescription,
      required this.appVersion});
}

class UpdatedItemWidget extends StatelessWidget {
  final UpdatedItemModel model;
  UpdatedItemWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //组合上下两部分
    return Column(
        children: <Widget>[buildTopRow(context), buildBottomRow(context)]);
  }

  //创建上半部分
  Widget buildTopRow(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(model.appIcon, width: 80, height: 80))),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.appName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, color: Color(0xFF8E8D92)),
            ),
            Text(
              "${model.appDate}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: FlatButton(
          color: Color(0xFFF1F0F7),
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          child: Text(
            "OPEN",
            style: TextStyle(
                color: Color(0xFF007AFE), fontWeight: FontWeight.bold),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: onPressed,
        ),
      ),
    ]);
  }

  //创建下半部分
  Widget buildBottomRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.appDescription,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: Text("${model.appVersion} • ${model.appSize} MB"))
            ]));
  }
}
