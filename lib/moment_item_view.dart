import 'dart:ui';
import 'package:VMESHOU/big_avater.dart';
import 'package:VMESHOU/moment_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'base/utils/screen_utils.dart';
import 'generated/assets.dart';
import 'bean/ImageInfoBean.dart';
import 'bean/moment_item_entity.dart';

class MomentItemView extends StatefulWidget {
  final MomentItemEntity datas;

  const MomentItemView({Key? key, required this.datas}) : super(key: key);

  @override
  State<MomentItemView> createState() => _MomentItemViewState();
}

class _MomentItemViewState extends State<MomentItemView> {
  Widget getHeaderView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            child: Hero(tag: "avatar_${widget.datas.articleId}",
            child: Image.network(
              "${widget.datas.userAvatar}",
              // "https://file-cdn.vmeshou.com/cfaf3a6a0c1ea702497d9c62f14a56a9/w/600/d/0.jpg",
              //"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fww4.sinaimg.cn%2Fmw690%2F005YDrd6gy1h521ma9zszj32t01vc1kz.jpg&refer=http%3A%2F%2Fwww.sina.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1663137729&t=65f09e8463c70616c53209ea72e60f85",
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stack) {
                return Image.asset(
                  Assets.imagesDefeat,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                );
              },
            ),),
            onTap: () {
              /*Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,a1,a2){
                return BigAvatar(avatar: "${widget.datas.userAvatar}");
              }));*/
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  BigAvatar(avatar: "${widget.datas.userAvatar}",articleId: "${widget.datas.articleId}",);
              }));
            },
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //姓名
              Row(
                children: [
                  //姓名
                  Text("${widget.datas.userName}",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff59728b))),

                  //置顶 显示
                  Visibility(
                      visible: widget.datas.isTop! > 0,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                border:
                                    Border.all(color: const Color(0xff59728b))),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 4, right: 4, top: 1, bottom: 1),
                              child: Text("置顶",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xff59728b))),
                            ),
                          ))),
                ],
              ),
              //时间
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.datas.createTime}",
                        style: const TextStyle(
                            color: Color(0xff999999), fontSize: 14)),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(1000)),
                          border: Border.all(color: const Color(0xff1a1a1a))),
                      child: const Padding(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          child: Text("复制文案",
                              style: TextStyle(
                                  color: Color(0xff1a1a1a), fontSize: 12))),
                    )
                  ],
                ),
              ),
              //内容
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "${widget.datas.content}",
                  //"\uD83D\uDD25唯蜜瘦小红书创作者计划第三弹\uD83D\uDD25\n如何快速掌握小红书流量密码？\n\uD83C\uDF08快扫码关注>唯蜜推荐官视频号<\n\uD83C\uDF088月17日晚8点，璐璐老师带来小红书直播课第三弹《你小红书做不起来？快上车，流量密码都在这！》\n\n\uD83D\uDCD5这个8月，每周三晚8点，璐璐老师与大家相约直播间，玩转小红书！GO！",
                  //"In Android, the View is the foundation of everything that shows up on the screen. Buttons, toolbars, and inputs, everything is a View. In Flutter, the rough equivalent to a View is a Widget. Widgets don’t map exactly to Android views, but while you’re getting acquainted with how Flutter works you can think of them as “the way you declare and construct UI”.",
                  style:
                      const TextStyle(color: Color(0xff999999), fontSize: 16),
                  // strutStyle: StrutStyle(height: 1.5),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ))
      ],
    );
  }

  /// 图片列表
  Widget getImageListView() {
    List<ImageInfoBean> getImageInfoList() {
      List<ImageInfoBean> list = [];
      //"source": "9e89c4f46f7d6e538d920c0822c6a832|4645864|2558x5064|jpg,2253f34c847b8ece443b2e0508e62082|4124048|2558x5064|jpg,5f577c719a2ddc89d2f71498774bcfaa|5032175|2558x5064|jpg,915eb798b9e0b3ddf2d170493bb42ce6|6559032|2300x4095|jpg,7a4886ae1958993c0ff6b752f95bbc75|4748475|2300x4095|jpg,1bc08914267c54119fe8851a6aa5559f|4014360|2300x3067|jpg",
      var source = widget.datas.xSource;
      if (source != null) {
        List<String> sourceList = source.split(",");
        ImageInfoBean infoBean;
        for (String s in sourceList) {
          infoBean = ImageInfoBean();
          List<String> ss = s.split("|");
          String source = ss[0];
          String w_h = ss[2];
          List<String> sss = w_h.split("x");
          infoBean.width = int.parse(sss[0]);
          infoBean.height = int.parse(sss[1]);
          if (infoBean.width <= 0 || infoBean.height <= 0) {
            continue;
          }
          infoBean.url =
              "https://file-cdn.vmeshou.com/$source/w/${infoBean.width}/d/0.jpg";
          //单个
          if (sourceList.length == 1) {
            infoBean.thumbnail = widget.datas.showCover!;
          } else {
            infoBean.thumbnail =
                "https://file-cdn.vmeshou.com/$source/w/${ScreenUtils.getScreenWidth() ~/ 4}/d/0.jpg";
          }
          list.add(infoBean);
        }
      }

      return list;
    }

    int totalCount = getImageInfoList().length;

    int getCrossAxisCount(int totalCount) {
      if (totalCount == 4) return 2;
      return 3;
    }

    Widget getChild(int totalCount) {
      double getSingleImageWidth(double realImageWidth, int n) {
        double halfScreenWidth = ScreenUtils.getScreenWidth() / n;
        if (halfScreenWidth < realImageWidth) return halfScreenWidth;
        return realImageWidth;
      }

      if (totalCount == 1) {
        int w = getImageInfoList()[0].width;
        int h = getImageInfoList()[0].height;
        double realWidth = 0;
        if (w > h) {
          //横图 显示宽一点
          realWidth =
              getSingleImageWidth(getImageInfoList()[0].width.toDouble(), 2);
        } else {
          realWidth =
              getSingleImageWidth(getImageInfoList()[0].width.toDouble(), 3);
        }

        return Image.network(
          getImageInfoList()[0].url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Image.asset(Assets.imagesLoadingImg,
                fit: BoxFit.cover, width: realWidth);
          },
          width: realWidth,
          errorBuilder: (context, error, stack) {
            return Image.asset(Assets.imagesDefeat,
                fit: BoxFit.cover, width: realWidth);
          },
        );
      }
      return GridView.builder(
          // gridview 默认顶部有空白区域
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: totalCount,
          physics: const NeverScrollableScrollPhysics(),
          //解决嵌套gridview滑动冲突问题
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(totalCount),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            return Image.network(
              getImageInfoList()[index].url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Image.asset(Assets.imagesLoadingImg,
                    fit: BoxFit.cover,
                    width: getImageInfoList()[index].width.toDouble());
                //下面的可以监听进度条
                double load = progress.cumulativeBytesLoaded.toDouble();
                int? total = progress.expectedTotalBytes;
                if (total != null) {
                  double p = load / total;
                  return Center(
                    child: CircularProgressIndicator(
                      value: p,
                      strokeWidth: 2,
                    ),
                  );
                }
                return child;
              },
              errorBuilder: (context, error, stack) {
                return Image.asset(Assets.imagesDefeat);
              },
              cacheWidth: getImageInfoList()[index].width,
              cacheHeight: getImageInfoList()[index].height,
            );
          });
    }

    EdgeInsetsGeometry getRightMargin(int totalCount) {
      double rightMargin = 0;
      double screenWidth = ScreenUtils.getScreenWidth();
      double gridViewWidth = screenWidth - 88; //gridView可用宽度
      double itemWidth = screenWidth / 4; //根据屏幕定义每一个图片的宽度
      rightMargin = gridViewWidth - getCrossAxisCount(totalCount) * itemWidth;
      if (rightMargin < 0) {
        rightMargin = 0;
      }
      return EdgeInsets.only(left: 56, top: 6, right: rightMargin);
    }

    return Container(
      margin: getRightMargin(totalCount),
      alignment: Alignment.topLeft,
      child: getChild(totalCount),
    );
  }

  Widget getSocialView() {
    return Padding(
      padding: const EdgeInsets.only(left: 56, top: 14),
      child: Row(
        children: [
          //点赞
          Row(
            children: [
              Image.asset(
                Assets.imagesIcZMomentLike,
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "${widget.datas.likeTimes}",
                  style:
                      const TextStyle(color: Color(0xff1a1a1a), fontSize: 12),
                ),
              )
            ],
          ),
          //收藏
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesIcZMomentCollect,
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "${widget.datas.collectionTimes}",
                      style: const TextStyle(
                          color: Color(0xff1a1a1a), fontSize: 12),
                    ),
                  )
                ],
              )),
          //评论
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imagesIcZMomentComment,
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "${widget.datas.commentTimes}",
                      style: const TextStyle(
                          color: Color(0xff1a1a1a), fontSize: 12),
                    ),
                  )
                ],
              )),
          //转发
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Assets.imagesIcZMomentShare,
                  width: 20,
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "一键转发",
                    style: TextStyle(color: Color(0xff1a1a1a), fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCommentListView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: getHeaderView(),
            onTap: () {
              //MaterialPageRoute
              Navigator.of(context).pushNamed("moment_detail",
                  arguments: {"articleId": widget.datas.articleId!.toString()});
              /*Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) {
                    return MomentDetailPage(
                        articleId: widget.datas.articleId!.toString());
                  })).then((value) => {
                    //接收返回值
                    //Fluttertoast.showToast(msg: value.toString())
              });*/
            },
          ),
          getImageListView(),
          getSocialView(),
          // getCommentListView()
        ],
      ),
    );
  }
}
