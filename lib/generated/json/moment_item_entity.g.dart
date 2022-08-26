
import '../../bean/moment_item_entity.dart';
import 'base/json_convert_content.dart';

MomentItemEntity $MomentItemEntityFromJson(Map<String, dynamic> json) {
	final MomentItemEntity momentItemEntity = MomentItemEntity();
	final int? articleId = jsonConvert.convert<int>(json['articleId']);
	if (articleId != null) {
		momentItemEntity.articleId = articleId;
	}
	final int? collectionTimes = jsonConvert.convert<int>(json['collectionTimes']);
	if (collectionTimes != null) {
		momentItemEntity.collectionTimes = collectionTimes;
	}
	final List<MomentItemCommentList>? commentList = jsonConvert.convertListNotNull<MomentItemCommentList>(json['commentList']);
	if (commentList != null) {
		momentItemEntity.commentList = commentList;
	}
	final int? commentTimes = jsonConvert.convert<int>(json['commentTimes']);
	if (commentTimes != null) {
		momentItemEntity.commentTimes = commentTimes;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		momentItemEntity.content = content;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		momentItemEntity.createTime = createTime;
	}
	final int? isCollection = jsonConvert.convert<int>(json['isCollection']);
	if (isCollection != null) {
		momentItemEntity.isCollection = isCollection;
	}
	final int? isDeploy = jsonConvert.convert<int>(json['isDeploy']);
	if (isDeploy != null) {
		momentItemEntity.isDeploy = isDeploy;
	}
	final int? isLike = jsonConvert.convert<int>(json['isLike']);
	if (isLike != null) {
		momentItemEntity.isLike = isLike;
	}
	final int? isTop = jsonConvert.convert<int>(json['isTop']);
	if (isTop != null) {
		momentItemEntity.isTop = isTop;
	}
	final int? likeTimes = jsonConvert.convert<int>(json['likeTimes']);
	if (likeTimes != null) {
		momentItemEntity.likeTimes = likeTimes;
	}
	final String? showCover = jsonConvert.convert<String>(json['showCover']);
	if (showCover != null) {
		momentItemEntity.showCover = showCover;
	}
	final String? xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		momentItemEntity.xSource = xSource;
	}
	final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
	if (timestamp != null) {
		momentItemEntity.timestamp = timestamp;
	}
	final int? topicId = jsonConvert.convert<int>(json['topicId']);
	if (topicId != null) {
		momentItemEntity.topicId = topicId;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		momentItemEntity.type = type;
	}
	final String? userAvatar = jsonConvert.convert<String>(json['userAvatar']);
	if (userAvatar != null) {
		momentItemEntity.userAvatar = userAvatar;
	}
	final String? userColorVal = jsonConvert.convert<String>(json['userColorVal']);
	if (userColorVal != null) {
		momentItemEntity.userColorVal = userColorVal;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		momentItemEntity.userId = userId;
	}
	final String? userLogo = jsonConvert.convert<String>(json['userLogo']);
	if (userLogo != null) {
		momentItemEntity.userLogo = userLogo;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		momentItemEntity.userName = userName;
	}
	return momentItemEntity;
}

Map<String, dynamic> $MomentItemEntityToJson(MomentItemEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articleId'] = entity.articleId;
	data['collectionTimes'] = entity.collectionTimes;
	data['commentList'] =  entity.commentList?.map((v) => v.toJson()).toList();
	data['commentTimes'] = entity.commentTimes;
	data['content'] = entity.content;
	data['createTime'] = entity.createTime;
	data['isCollection'] = entity.isCollection;
	data['isDeploy'] = entity.isDeploy;
	data['isLike'] = entity.isLike;
	data['isTop'] = entity.isTop;
	data['likeTimes'] = entity.likeTimes;
	data['showCover'] = entity.showCover;
	data['source'] = entity.xSource;
	data['timestamp'] = entity.timestamp;
	data['topicId'] = entity.topicId;
	data['type'] = entity.type;
	data['userAvatar'] = entity.userAvatar;
	data['userColorVal'] = entity.userColorVal;
	data['userId'] = entity.userId;
	data['userLogo'] = entity.userLogo;
	data['userName'] = entity.userName;
	return data;
}

MomentItemCommentList $MomentItemCommentListFromJson(Map<String, dynamic> json) {
	final MomentItemCommentList momentItemCommentList = MomentItemCommentList();
	final int? articleId = jsonConvert.convert<int>(json['articleId']);
	if (articleId != null) {
		momentItemCommentList.articleId = articleId;
	}
	final int? commentId = jsonConvert.convert<int>(json['commentId']);
	if (commentId != null) {
		momentItemCommentList.commentId = commentId;
	}
	final String? commenter = jsonConvert.convert<String>(json['commenter']);
	if (commenter != null) {
		momentItemCommentList.commenter = commenter;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		momentItemCommentList.content = content;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		momentItemCommentList.createTime = createTime;
	}
	final int? parentCommentId = jsonConvert.convert<int>(json['parentCommentId']);
	if (parentCommentId != null) {
		momentItemCommentList.parentCommentId = parentCommentId;
	}
	final String? receiver = jsonConvert.convert<String>(json['receiver']);
	if (receiver != null) {
		momentItemCommentList.receiver = receiver;
	}
	final int? toUserId = jsonConvert.convert<int>(json['toUserId']);
	if (toUserId != null) {
		momentItemCommentList.toUserId = toUserId;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		momentItemCommentList.userId = userId;
	}
	return momentItemCommentList;
}

Map<String, dynamic> $MomentItemCommentListToJson(MomentItemCommentList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articleId'] = entity.articleId;
	data['commentId'] = entity.commentId;
	data['commenter'] = entity.commenter;
	data['content'] = entity.content;
	data['createTime'] = entity.createTime;
	data['parentCommentId'] = entity.parentCommentId;
	data['receiver'] = entity.receiver;
	data['toUserId'] = entity.toUserId;
	data['userId'] = entity.userId;
	return data;
}