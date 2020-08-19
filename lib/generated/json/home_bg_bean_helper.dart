import 'file:///E:/Code/Flutter/book_web/lib/bean/home/home_bg_bean.dart';

homeBgBeanFromJson(HomeBgBean data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error']?.toInt();
	}
	if (json['result'] != null) {
		data.result = json['result']?.toInt();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBgBeanToJson(HomeBgBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['result'] = entity.result;
	data['img'] = entity.img;
	return data;
}