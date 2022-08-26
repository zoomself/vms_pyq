/// datas : [{"articleId":1840609,"collectionTimes":9,"commentList":[{"articleId":1840609,"commentId":283932,"commenter":"做海报的小V②号","content":"宝宝们想要什么样的发圈海报～留言告诉小V哦?","createTime":"2022-08-17 09:18:19","parentCommentId":0,"toUserId":0,"userId":773462}],"commentTimes":1,"content":"今日份海报来咯?","createTime":"2022-08-17 09:16:48","isCollection":0,"isDeploy":1,"isLike":0,"isTop":2,"likeTimes":17,"showCover":"https://file-cdn.vmeshou.com/9e89c4f46f7d6e538d920c0822c6a832/w/1200/d/0.jpg","source":"9e89c4f46f7d6e538d920c0822c6a832|4645864|2558x5064|jpg,2253f34c847b8ece443b2e0508e62082|4124048|2558x5064|jpg,5f577c719a2ddc89d2f71498774bcfaa|5032175|2558x5064|jpg,915eb798b9e0b3ddf2d170493bb42ce6|6559032|2300x4095|jpg,7a4886ae1958993c0ff6b752f95bbc75|4748475|2300x4095|jpg,1bc08914267c54119fe8851a6aa5559f|4014360|2300x3067|jpg","timestamp":1660699008000,"topicId":0,"type":"pic","userAvatar":"https://file-cdn.vmeshou.com/801a057a099e2dac1721c4e3266fc140/w/600/d/0.jpg","userColorVal":"#EA878B","userId":773462,"userLogo":"https://file-cdn.vmeshou.com/20c32aafc47cfe179dcc5a0633946dbf/w/100/d/0.jpg","userName":"做海报的小V②号"}]
/// resp_code : 0
/// resp_msg : "获取成功"

class MomentListBean {
  MomentListBean({
      this.datas, 
      this.respCode, 
      this.respMsg,});

  MomentListBean.fromJson(dynamic json) {
    if (json['datas'] != null) {
      datas = [];
      json['datas'].forEach((v) {
        datas?.add(Datas.fromJson(v));
      });
    }
    respCode = json['resp_code'];
    respMsg = json['resp_msg'];
  }
  List<Datas>? datas;
  num? respCode;
  String? respMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (datas != null) {
      map['datas'] = datas?.map((v) => v.toJson()).toList();
    }
    map['resp_code'] = respCode;
    map['resp_msg'] = respMsg;
    return map;
  }

}

/// articleId : 1840609
/// collectionTimes : 9
/// commentList : [{"articleId":1840609,"commentId":283932,"commenter":"做海报的小V②号","content":"宝宝们想要什么样的发圈海报～留言告诉小V哦?","createTime":"2022-08-17 09:18:19","parentCommentId":0,"toUserId":0,"userId":773462}]
/// commentTimes : 1
/// content : "今日份海报来咯?"
/// createTime : "2022-08-17 09:16:48"
/// isCollection : 0
/// isDeploy : 1
/// isLike : 0
/// isTop : 2
/// likeTimes : 17
/// showCover : "https://file-cdn.vmeshou.com/9e89c4f46f7d6e538d920c0822c6a832/w/1200/d/0.jpg"
/// source : "9e89c4f46f7d6e538d920c0822c6a832|4645864|2558x5064|jpg,2253f34c847b8ece443b2e0508e62082|4124048|2558x5064|jpg,5f577c719a2ddc89d2f71498774bcfaa|5032175|2558x5064|jpg,915eb798b9e0b3ddf2d170493bb42ce6|6559032|2300x4095|jpg,7a4886ae1958993c0ff6b752f95bbc75|4748475|2300x4095|jpg,1bc08914267c54119fe8851a6aa5559f|4014360|2300x3067|jpg"
/// timestamp : 1660699008000
/// topicId : 0
/// type : "pic"
/// userAvatar : "https://file-cdn.vmeshou.com/801a057a099e2dac1721c4e3266fc140/w/600/d/0.jpg"
/// userColorVal : "#EA878B"
/// userId : 773462
/// userLogo : "https://file-cdn.vmeshou.com/20c32aafc47cfe179dcc5a0633946dbf/w/100/d/0.jpg"
/// userName : "做海报的小V②号"

class Datas {
  Datas({
      this.articleId, 
      this.collectionTimes, 
      this.commentList, 
      this.commentTimes, 
      this.content, 
      this.createTime, 
      this.isCollection, 
      this.isDeploy, 
      this.isLike, 
      this.isTop, 
      this.likeTimes, 
      this.showCover, 
      this.source, 
      this.timestamp, 
      this.topicId, 
      this.type, 
      this.userAvatar, 
      this.userColorVal, 
      this.userId, 
      this.userLogo, 
      this.userName,});

  Datas.fromJson(dynamic json) {
    articleId = json['articleId'];
    collectionTimes = json['collectionTimes'];
    if (json['commentList'] != null) {
      commentList = [];
      json['commentList'].forEach((v) {
        commentList?.add(CommentList.fromJson(v));
      });
    }
    commentTimes = json['commentTimes'];
    content = json['content'];
    createTime = json['createTime'];
    isCollection = json['isCollection'];
    isDeploy = json['isDeploy'];
    isLike = json['isLike'];
    isTop = json['isTop'];
    likeTimes = json['likeTimes'];
    showCover = json['showCover'];
    source = json['source'];
    timestamp = json['timestamp'];
    topicId = json['topicId'];
    type = json['type'];
    userAvatar = json['userAvatar'];
    userColorVal = json['userColorVal'];
    userId = json['userId'];
    userLogo = json['userLogo'];
    userName = json['userName'];
  }
  num? articleId;
  num? collectionTimes;
  List<CommentList>? commentList;
  num? commentTimes;
  String? content;
  String? createTime;
  num? isCollection;
  num? isDeploy;
  num? isLike;
  num? isTop;
  num? likeTimes;
  String? showCover;
  String? source;
  num? timestamp;
  num? topicId;
  String? type;
  String? userAvatar;
  String? userColorVal;
  num? userId;
  String? userLogo;
  String? userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleId'] = articleId;
    map['collectionTimes'] = collectionTimes;
    if (commentList != null) {
      map['commentList'] = commentList?.map((v) => v.toJson()).toList();
    }
    map['commentTimes'] = commentTimes;
    map['content'] = content;
    map['createTime'] = createTime;
    map['isCollection'] = isCollection;
    map['isDeploy'] = isDeploy;
    map['isLike'] = isLike;
    map['isTop'] = isTop;
    map['likeTimes'] = likeTimes;
    map['showCover'] = showCover;
    map['source'] = source;
    map['timestamp'] = timestamp;
    map['topicId'] = topicId;
    map['type'] = type;
    map['userAvatar'] = userAvatar;
    map['userColorVal'] = userColorVal;
    map['userId'] = userId;
    map['userLogo'] = userLogo;
    map['userName'] = userName;
    return map;
  }

}

/// articleId : 1840609
/// commentId : 283932
/// commenter : "做海报的小V②号"
/// content : "宝宝们想要什么样的发圈海报～留言告诉小V哦?"
/// createTime : "2022-08-17 09:18:19"
/// parentCommentId : 0
/// toUserId : 0
/// userId : 773462

class CommentList {
  CommentList({
      this.articleId, 
      this.commentId, 
      this.commenter, 
      this.content, 
      this.createTime, 
      this.parentCommentId, 
      this.toUserId, 
      this.userId,});

  CommentList.fromJson(dynamic json) {
    articleId = json['articleId'];
    commentId = json['commentId'];
    commenter = json['commenter'];
    content = json['content'];
    createTime = json['createTime'];
    parentCommentId = json['parentCommentId'];
    toUserId = json['toUserId'];
    userId = json['userId'];
  }
  num? articleId;
  num? commentId;
  String? commenter;
  String? content;
  String? createTime;
  num? parentCommentId;
  num? toUserId;
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleId'] = articleId;
    map['commentId'] = commentId;
    map['commenter'] = commenter;
    map['content'] = content;
    map['createTime'] = createTime;
    map['parentCommentId'] = parentCommentId;
    map['toUserId'] = toUserId;
    map['userId'] = userId;
    return map;
  }

}