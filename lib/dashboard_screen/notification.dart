import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/utils/image.dart';
import 'package:parth_shah_task_1/utils/string.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 145,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: const Row(
            children: [
              Icon(Icons.notifications_outlined),
              Text(
                StringUtils.notification,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(ImageUtils.menu_2_img),
                Image.asset(ImageUtils.spread_img),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Image.asset(ImageUtils.close_img)),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildNotificationCard(),
          buildNotificationCard(),
          const CommentCard(
            avatar: ImageUtils.user_1_img,
            name: StringUtils.name,
            comment: StringUtils.notificationReply,
            task: StringUtils.notificationTask,
            time: StringUtils.notificationTime,
          ),
        ],
      ),
    );
  }

  Widget buildNotificationCard(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImageUtils.user_1_img),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: StringUtils.name2,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: StringUtils.addTask),
                            ],
                          ),
                        ),
                        Image.asset(ImageUtils.horizontal_dot_img,height: 20,),
                      ],
                    ),
                    Container(
                      height: 55,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                          width: 2,
                        )
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageUtils.check_img,height: 30,),
                          const SizedBox(width: 7,),
                          const Text(StringUtils.secondSubTitle,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    ),
                    Text(StringUtils.time1,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String comment;
  final String task;
  final String time;

  const CommentCard({super.key,
    required this.avatar,
    required this.name,
    required this.comment,
    required this.task,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(ImageUtils.user_1_img),
                ),
                const SizedBox(width: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: StringUtils.comment_reply,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Image.asset(ImageUtils.horizontal_dot_img,height: 20,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 25 ,
                  width: 2,
                  color: Colors.deepPurpleAccent,
                ),
                const SizedBox(width: 10,),
                Text(
                  task,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              comment,
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 8.0),
            Text(
              time,
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
