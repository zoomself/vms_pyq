import 'package:VMESHOU/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountPage2 extends StatefulWidget {
  const CountPage2({Key? key}) : super(key: key);

  @override
  State<CountPage2> createState() => _CountPage2State();
}

class _CountPage2State extends State<CountPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page2"),
      ),
      body: Center(
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
