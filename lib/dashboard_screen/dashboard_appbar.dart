import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/dashboard_screen/notification.dart';
import 'package:parth_shah_task_1/utils/image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 2.0,
          width: double.infinity,
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      leadingWidth: 135,
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
          child: Image.asset(ImageUtils.menu_2_img,),),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height:33,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(ImageUtils.user_1_img),
                        ),
                      ),
                      // Second avatar
                      const Positioned(
                        left: 20,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(ImageUtils.user_1_img),
                        ),
                      ),
                      // Plus button
                      Positioned(
                        left: 40,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
                const SizedBox(width: 8,),
                Image.asset(ImageUtils.menu_img,height: 35,)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
