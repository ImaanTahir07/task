import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:social_champ_task/Components/CustomAppBar.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? data;

  const DetailsScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, data == null ? "Details" : "${data!['username']}"),
      body: data == null ? _buildNoDataScreen() : _buildDetailsScreen(context),
    );
  }

  Widget _buildNoDataScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150.h,
            width: 150.w,
            child: Lottie.asset("assets/images/Animation - 1722601106201.json"),
          ),
          SizedBox(height: 20.h),
          Text(
            'No data received',
            style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(context, "Name", data!['username']),
                    SizedBox(height: 12.h),
                    _buildDetailRow(context,"Email", data!['email']),
                    SizedBox(height: 12.h),
                    _buildDetailRow(context,"Company", data!['company']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context,String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:Theme.of(context)
              .textTheme
              .bodyLarge
              ?.merge(
            TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
        Text(
          value,
          style: Theme.of(context)
        .textTheme
        .bodyLarge
        ?.merge(
    TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
      fontWeight: FontWeight.bold
    ),
    ),
        ),
      ],
    );
  }

}
