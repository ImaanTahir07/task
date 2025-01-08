
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDeleteConfirmationDialog(
    BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Text(
          "Confirm Deletion",
          style: Theme.of(context).textTheme.bodyLarge?.merge(
            TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        content: Text(
          "Are you sure you want to delete this item? This action cannot be undone.",
          style: Theme.of(context).textTheme.bodyLarge?.merge(
            TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel", style: Theme.of(context).textTheme.bodyLarge?.merge(
              TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
              ),
            ),),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.withOpacity(0.5),
            ),
            child: Text(
              "Delete",

              style: Theme.of(context).textTheme.bodyLarge?.merge(
                TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
