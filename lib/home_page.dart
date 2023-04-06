import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'vertical_text.dart';

double singleLineWidth = 16;
int numberOfSingleLineText = 10;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textContent = '';
  String from = '';

  loadTextContent() async {
    var url = Uri.parse('https://v1.hitokoto.cn?c=k');
    var response = await http.post(url);
    Map<String, dynamic> respData = json.decode(response.body);
    setState(() {
      textContent = respData['hitokoto'];
      from = ' —— ' + respData['from_who'];
    });
  }

  Widget imageWidget() {
    return AnimatedOpacity(
      opacity: textContent == '' ? 0 : 1,
      duration: const Duration(milliseconds: 2000),
      child: const CircleAvatar(
          backgroundColor: Colors.white70,
          foregroundImage: NetworkImage(
              'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
          radius: 90),
    );
  }

  // 竖排文字组件
  Widget textWidget() {
    return AnimatedOpacity(
        // 透明渐变动画
        opacity: textContent == '' ? 0 : 1,
        duration: const Duration(milliseconds: 2000),
        child: VerticalText(
            // 竖排文字组件
            textContent: textContent,
            from: from,
            singleLineWidth: singleLineWidth,
            numberOfSingleLineText: numberOfSingleLineText));
  }

  @override
  void initState() {
    super.initState();
    loadTextContent();
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
