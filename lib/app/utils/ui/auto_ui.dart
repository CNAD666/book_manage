import 'package:flutter_screenutil/flutter_screenutil.dart';


//按照宽度适配
double setWidth(double size){
  return ScreenUtil().setWidth(size);
}

//按照高度适配
double setHeight(double size){
  return ScreenUtil().setHeight(size);
}

//适配文字
double setSp(double size){
  return ScreenUtil().setSp(size);
}

//自动适配,后面方便扩展
double auto(double size){
  return size;
}