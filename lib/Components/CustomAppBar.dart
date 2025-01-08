import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App Bar
AppBar buildAppBar(BuildContext context,String title) {
  return AppBar(
      backgroundColor: Colors.purple,
      title: Text(title,style:  Theme.of(context)
          .textTheme
          .bodyLarge
          ?.merge(
        TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
        ),
      ),));
}
