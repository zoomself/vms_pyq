
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'base/net/net_client.dart';
import 'base/utils/log_utils.dart';
import 'bean/moment_item_entity.dart';
import 'bean/moment_label_entity.dart';
import 'moment_item_view.dart';

class MomentListPage extends StatefulWidget {
  final MomentLabelEntity label;

  const MomentListPage({Key? key, required this.label}) : super(key: key);

  @override
  State<MomentListPage> createState() => _MomentListPageState();
}

class _MomentListPageState extends State<MomentListPage> {
  List<MomentItemEntity> dataList = [];
  String articleId = "";

  int pageSize = 20;
  bool canLoadMore = true;
  int currentPage = 1;

  final EasyRefreshController _controller = EasyRefreshController();

  void refresh() {
    articleId = "";
    canLoadMore = true;
    currentPage = 1;
    getData();
  }

  void loadMore() {
    if (canLoadMore) {
      currentPage++;
      getData();
    } else {
      Fluttertoast.showToast(msg: "暂无更多数据");
    }
  }

  void getData() {
    String labelId = widget.label.labelId.toString();
    String type = "label";
    String path =
        "https://api.vmeshou.com/api-edu/app/article/list?size=$pageSize&type=$type&labelId=$labelId";
    if (articleId.isNotEmpty) {
      path =
          "https://api.vmeshou.com/api-edu/app/article/list?size=$pageSize&type=$type&articleId=$articleId&labelId=$labelId";
    }
    NetClient().get<List<MomentItemEntity>>(path, onSuccess: (list) {
      if(mounted){
        setState(() {
          articleId = list[list.length - 1].articleId.toString();
          if (list.length < pageSize) {
            canLoadMore = false;
          }
          if (currentPage == 1) {
            dataList.clear();
          }
          dataList.addAll(list);
          if (currentPage == 1) {
            _controller.finishRefresh();
          } else {
            _controller.finishLoad(noMore: canLoadMore);
          }
        });
      }
    },
        onError: (e) {
      print("error: $path ===> $e");
    });

  }

  @override
  void initState() {
    super.initState();
    LogUtils.log("initState MomentListPage");
    refresh();
  }

  @override
  void dispose() {
    super.dispose();
    LogUtils.log("dispose MomentListPage");
    dataList.clear();

  }

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      if (dataList.isEmpty) {
        return const Center(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 2,
            ),
          ),
        );
      }
      //return MomentItemView(datas: datas!);
      return EasyRefresh(
          controller: _controller,
          onRefresh: () async {
            refresh();
          },
          onLoad: () async {
            loadMore();
          },
          child: ListView.separated(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return MomentItemView(datas: dataList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 0.5,
                color: Color(0xFFCCCCCC),
              );
            },
          ));
      return ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return MomentItemView(datas: dataList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 0.5,
            color: Color(0xFFCCCCCC),
          );
        },
      );
    }

    return getBody();
  }
}
