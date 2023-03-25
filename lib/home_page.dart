import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Widget imageWidget() {
    return const CircleAvatar(
        backgroundColor: Colors.white70,
        foregroundImage: NetworkImage(
            'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
        radius: 90);
  }
  Widget textWidget() {
    return Text("文本显示示例");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[imageWidget(), textWidget()],
        ),
      ),
    );
  }
}