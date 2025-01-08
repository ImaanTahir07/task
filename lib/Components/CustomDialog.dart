import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_champ_task/Components/TextField.dart';

import '../Providers/homeProviders.dart';

void showCustomDialog(BuildContext context, WidgetRef ref) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          "Enter Details",
          style: Theme.of(context).textTheme.bodyLarge?.merge(
            TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 0.051.sh,
                  child: textField(nameController, "Enter Name",              (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },)),
              SizedBox(height: 12),
              SizedBox(
                  height: 0.051.sh,
                  child: textField(emailController, "Enter Email",              (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },)),
              SizedBox(height: 12),
              SizedBox(
                  height: 0.051.sh,
                  child: textField(companyController, "Enter Company name",              (value) {
                    if (value == null || value.isEmpty) {
                      return 'Company name is required';
                    }
                    return null;
                  },)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog without any action
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if(nameController.text.isEmpty||emailController.text.isEmpty||companyController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill out all the fields',style: GoogleFonts.poppins(),),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              }else if(!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(emailController.text)){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter valid email',style: GoogleFonts.poppins(),),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              }

              else {
                ref.read(homeNotifierProvider.notifier).addUser({
                  "username": nameController.text.toString(),
                  "email": emailController.text.toString(),
                  "company": {"name": companyController.text.toString()}
                });
                Navigator.pop(context);
              }
            },
            child: Text("Submit"),
          ),
        ],
      );
    },
  );
}