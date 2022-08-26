import 'package:VMESHOU/provider/count_page_2.dart';
import 'package:VMESHOU/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountPage1 extends StatefulWidget {
  const CountPage1({Key? key}) : super(key: key);

  @override
  State<CountPage1> createState() => _CountPage1State();
}

class _CountPage1State extends State<CountPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page1"),
        actions: [
          InkWell(
            child: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CountPage2();
              }));
            },
          )
        ],
      ),
      body: Center(
        //Provider.of listen: true or false 要根据界面是否需要改变来定，写错了程序会报错，默认为ture, 比如这里需要改变次数
        child: Text("点击次数：${Provider.of<CounterProvider>(context,listen: true).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context,listen: false).add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
