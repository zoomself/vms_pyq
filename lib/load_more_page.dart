import 'package:flutter/material.dart';

class LoadMorePage extends StatefulWidget {
  const LoadMorePage({Key? key}) : super(key: key);

  @override
  State<LoadMorePage> createState() => _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  List<String> dataList = [];
  int n = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          for (int i = 0; i < 20; i++) {
            n=n+1,
            if(i<19){
              dataList.add("$n")
            }else{
              dataList.add("end")
            }
          },
          setState(() {})
        });
  }


  Widget getBody() {
    if (dataList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    getData();
    return ListView.separated(
        itemBuilder: (context, index) {
          var data=dataList[index];
          if(data=="end"){
            if(dataList.length<100){
              getData();
              return const CircularProgressIndicator();
            }else{
              return const Text("没有更多了");
            }
          }
          return ListTile(title: Text(dataList[index]),);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: dataList.length);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loadMore_test"),
      ),
      body: getBody(),
    );
  }
}
