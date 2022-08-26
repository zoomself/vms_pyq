import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/moment_label_entity.g.dart';

@JsonSerializable()
class MomentLabelEntity {

	String? createTime;
	int? isInside;
	int? labelId;
	String? name;
	String? remark;
	int? sort;
  
  MomentLabelEntity();

  factory MomentLabelEntity.fromJson(Map<String, dynamic> json) => $MomentLabelEntityFromJson(json);

  Map<String, dynamic> toJson() => $MomentLabelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}