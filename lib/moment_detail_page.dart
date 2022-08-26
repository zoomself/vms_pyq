import 'package:VMESHOU/base/net/net_client.dart';
import 'package:VMESHOU/base/utils/log_utils.dart';
import 'package:VMESHOU/bean/moment_item_entity.dart';
import 'package:VMESHOU/moment_item_view.dart';
import 'package:flutter/material.dart';

class MomentDetailPage extends StatefulWidget {
  final String articleId;

  const MomentDetailPage({Key? key, required this.articleId}) : super(key: key);

  @override
  State<MomentDetailPage> createState() => _MomentDetailPageState();
}

class _MomentDetailPageState extends State<MomentDetailPage> {
  MomentItemEntity? entity;

  void getData() {
    String path = "https://api.vmeshou.com/api-edu/app/article/detail";
    NetClient().get<MomentItemEntity>(path,
        queryParameters: {"articleId": widget.articleId}, onSuccess: (bean) {
      if(mounted){
        setState(() {
          entity = bean;
        });
      }

    });
  }

  Widget getBody() {
    if (entity == null) {
      return const Center(
        child: Text(
          "加载中..",
          style: TextStyle(fontSize: 16),
        ),
      );
    }
    return Container(
      child: MomentItemView(datas: entity!),
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
    LogUtils.log("initState MomentDetailPage");
  }

  @override
  void dispose() {
    super.dispose();
    LogUtils.log("dispose MomentDetailPage");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: const Text("详情"),
        titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff1a1a1a)),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back,color: Color(0xff1a1a1a),),
          onTap: () {
            Navigator.of(context).pop("返回成功");
          },
        ),
      ),
      body: getBody(),
    );
  }
}
