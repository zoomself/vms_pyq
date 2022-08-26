import 'dart:ui';

import 'package:VMESHOU/anim_test.dart';
import 'package:VMESHOU/base/utils/log_utils.dart';
import 'package:VMESHOU/load_more_page.dart';
import 'package:VMESHOU/moment_detail_page.dart';
import 'package:VMESHOU/moment_detail_page_test.dart';
import 'package:VMESHOU/paint_test.dart';
import 'package:VMESHOU/provider/count_page_1.dart';
import 'package:VMESHOU/provider/counter_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'base/net/net_client.dart';
import 'bean/moment_label_entity.dart';
import 'generated/assets.dart';
import 'moment_list_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      //有好几种provider ，看你继承的是哪个 ,必须指定特定的类型，比如 ChangeNotifierProvider
      ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(0))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getRouteWidget(window.defaultRouteName),
      onGenerateRoute: (settings) {
        //通过Navigator.of(context).pushNamed("xxx") 打开页面，而且xxx在routes中未定义，就会在此回调
        LogUtils.log("settings ---> ${settings.name}   ${settings.arguments}");
        return MaterialPageRoute(builder: (context) {
          return MomentDetailTestPage();
        });
      },
      routes: {
        "moment_detail": (context) {
          //使用这种注册的路由跳转有个好处，就是可以统一跳转逻辑，比如跳转某个页面必须登录
          //则可以作个统一的前置条件
          //判断本地token是否为空，用户是否登录
          dynamic arguments = ModalRoute.of(context)?.settings.arguments;
          String articleId = arguments["articleId"]!;
          return MomentDetailPage(articleId: articleId);
        }
      },
    );
  }

  Widget getRouteWidget(String initialRoute) {
    LogUtils.log("initialRoute:$initialRoute");

    switch (initialRoute) {
      case "moment_detail":
        return const MomentDetailPage(articleId: "1641");
      default:
        //return const MyTestPage();
        //return const LoadMorePage();
        // return const AnimTest();
        //   return const PaintTest();
        //    return const CountPage1();
        return const MyHomePage();
    }
  }
}

class MyTestPage extends StatefulWidget {
  const MyTestPage({Key? key}) : super(key: key);

  @override
  State<MyTestPage> createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  var channel = const MethodChannel("com.zoomself.vms");

  void goTest() async {
    String result = await channel.invokeMethod("goTest");
    Fluttertoast.showToast(msg: result);
  }

  void goLogin() async {
    String result = await channel.invokeMethod("needLogin");
    Fluttertoast.showToast(msg: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              child: const Text("点击我.."),
              onTap: () {
                goLogin();
              },
            ),
            InkWell(
              child: const Text("别点击我.."),
              onTap: () {
                goTest();
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  List<MomentLabelEntity> labelList = [];
  var methodChannel = const MethodChannel('com.zoomself.vms');

  //final PageController _pageController = PageController();

  void getData() {
    ///api-edu/app/ope/label/list
    String path = "https://api.vmeshou.com/api-edu/app/ope/label/list";
    NetClient().get<List<MomentLabelEntity>>(path, onSuccess: (list) {
      if (mounted) {
        labelList.clear();
        labelList.addAll(list);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    LogUtils.log("initState MyApp");

    WidgetsBinding.instance.addObserver(this);
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    LogUtils.log("dispose MyApp");
    labelList.clear();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    LogUtils.log("didChangeAppLifecycleState state:$state");
    if (state == AppLifecycleState.resumed) {
      methodChannel = const MethodChannel('com.zoomself.vms');
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getTabs() {
      List<Widget> list = [];
      for (MomentLabelEntity datas in labelList) {
        list.add(Tab(child: Text(datas.name!)));
      }
      return list;
    }

    List<Widget> getBodys() {
      List<Widget> list = [];
      for (MomentLabelEntity datas in labelList) {
        list.add(MomentListPage(label: datas));
      }
      return list;
    }

    void goToLogin() async {
      LogUtils.log("goToLogin");
      methodChannel
          .invokeMethod('needLogin')
          .then((value) => {Fluttertoast.showToast(msg: "result===$value")});
    }

    if (labelList.isEmpty) {
      return Scaffold(
        body: Center(
          child: InkWell(
            child: const Text("加载中..."),
            onTap: () {
              getData();
            },
          ),
        ),
      );
    } else {
      return DefaultTabController(
          length: labelList.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
              primary: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(Assets.imagesBgZMomentTop111,
                    fit: BoxFit.cover),
              ),
              //flexibleSpace: FlexibleSpaceBar(background: Image.network("https://img0.baidu.com/it/u=1856361621,3839417498&fm=253&fmt=auto&app=120&f=JPEG?w=690&h=388",fit: BoxFit.cover,),),
              centerTitle: true,
              title: InkWell(
                child: const Text(
                  "VMESHOU 朋友圈",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1a1a1a)),
                ),
                onTap: () {
                  //goToLogin();
                  Navigator.of(context).pushNamed("ddd");
                },
              ),
              bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  indicatorWeight: 1,
                  indicatorPadding: const EdgeInsets.only(top: 42),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: const Color(0xff1A1A1A),
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  labelColor: const Color(0xff1A1A1A),
                  unselectedLabelColor: const Color(0xff999999),
                  indicator: BoxDecoration(
                    color: const Color(0xff1A1A1A),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  tabs: getTabs(),
                  onTap: (index) {
                    //_pageController.jumpToPage(index);
                  },
                ),
                preferredSize: const Size.fromHeight(kTextTabBarHeight),
              ),
            ),
            body: TabBarView(children: getBodys()),
            //  body: const Center(child: Text("aaaa"),)
            /*body: PageView.builder(
          //controller: _pageController,
          itemBuilder: (context, index) {
            return MomentListPage(label: labelList[index]);
          },
          itemCount: labelList.length,
        )*/
            // This trailing comma makes auto-formatting nicer for build methods.
          ));

/*
      TabController _tabController =
          TabController(length: labelList.length, vsync: this);
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: systemUiOverlayStyle,
          primary: true,
          flexibleSpace: FlexibleSpaceBar(
            background:
                Image.asset(Assets.imagesBgZMomentTop111, fit: BoxFit.cover),
          ),
          //flexibleSpace: FlexibleSpaceBar(background: Image.network("https://img0.baidu.com/it/u=1856361621,3839417498&fm=253&fmt=auto&app=120&f=JPEG?w=690&h=388",fit: BoxFit.cover,),),
          centerTitle: true,
          title: const Text(
            "VMESHOU 朋友圈",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff1a1a1a)),
          ),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              indicatorWeight: 1,
              indicatorPadding: const EdgeInsets.only(top: 42),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: const Color(0xff1A1A1A),
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              labelColor: const Color(0xff1A1A1A),
              unselectedLabelColor: const Color(0xff999999),
              indicator: BoxDecoration(
                color: Color(0xff1A1A1A),
                borderRadius: BorderRadius.circular(4),
              ),
              controller: _tabController,
              tabs: getTabs(),
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            ),
            preferredSize: Size.fromHeight(kTextTabBarHeight),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return MomentListPage(label: labelList[index]);
          },
          itemCount: labelList.length,
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );*/
    }
  }
}
