import 'package:book_web/bean/home/home_bg_x_w_bean.dart';

homeBgXWBeanFromJson(HomeBgXWBean data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['imgurl'] != null) {
		data.imgurl = json['imgurl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBgXWBeanToJson(HomeBgXWBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['imgurl'] = entity.imgurl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}