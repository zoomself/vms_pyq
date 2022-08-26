
import '../../bean/moment_label_entity.dart';
import 'base/json_convert_content.dart';

MomentLabelEntity $MomentLabelEntityFromJson(Map<String, dynamic> json) {
	final MomentLabelEntity momentLabelEntity = MomentLabelEntity();
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		momentLabelEntity.createTime = createTime;
	}
	final int? isInside = jsonConvert.convert<int>(json['isInside']);
	if (isInside != null) {
		momentLabelEntity.isInside = isInside;
	}
	final int? labelId = jsonConvert.convert<int>(json['labelId']);
	if (labelId != null) {
		momentLabelEntity.labelId = labelId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		momentLabelEntity.name = name;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		momentLabelEntity.remark = remark;
	}
	final int? sort = jsonConvert.convert<int>(json['sort']);
	if (sort != null) {
		momentLabelEntity.sort = sort;
	}
	return momentLabelEntity;
}

Map<String, dynamic> $MomentLabelEntityToJson(MomentLabelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['createTime'] = entity.createTime;
	data['isInside'] = entity.isInside;
	data['labelId'] = entity.labelId;
	data['name'] = entity.name;
	data['remark'] = entity.remark;
	data['sort'] = entity.sort;
	return data;
}