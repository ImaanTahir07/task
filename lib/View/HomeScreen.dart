import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:social_champ_task/Components/CustomDialog.dart';
import 'package:social_champ_task/Components/DeleteDialog.dart';
import 'package:social_champ_task/Routes/app_routes_constants.dart';
import 'package:social_champ_task/Routes/go_router_provider.dart';
import 'package:social_champ_task/View/DetailsScreen.dart';

import '../Components/CustomAppBar.dart';
import '../Providers/homeProviders.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fetchData = ref.watch(fetchDataProvider);
    var userList = ref.watch(homeNotifierProvider);

    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "Refresh",
              onPressed: () {
                ref.refresh(fetchDataProvider);
              },
              child: Icon(Icons.refresh),
            ),
            SizedBox(
              height: 12.h,
            ),
            FloatingActionButton(
              heroTag: "AddButton",
              onPressed: () {
                showCustomDialog(context, ref);
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        appBar: buildAppBar(context, "Users List"),
        body:

        ref.read(homeNotifierProvider.notifier).loading?
            const Center(child: CircularProgressIndicator()):
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.push("/${detailsRoute}", extra: {
                      "username": userList[index]["username"],
                      "email": userList[index]['email'],
                      "company": userList[index]["company"]["name"]
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.purple.shade50,
                          child: Icon(Icons.person),
                        ),
                        title: Text("${userList[index]["username"] ?? ""}",style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.merge(
                          TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),),
                        subtitle: Text("${userList[index]['email']?? ""}"),
                        trailing: IconButton(
                            onPressed: () {
                              showDeleteConfirmationDialog(context, () {
                                ref
                                    .read(homeNotifierProvider.notifier)
                                    .deleteItem(index);
                              });
                            },
                            icon:const Icon(Icons.delete)),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}




