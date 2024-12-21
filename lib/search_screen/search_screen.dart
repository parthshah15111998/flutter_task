import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/utils/image.dart';
import 'package:parth_shah_task_1/utils/string.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          buildAllTabs(),
          buildListItm(
              ImageUtils.plus_img,
              StringUtils.create_task,
              StringUtils.partners,
              ImageUtils.command_img,
              ImageUtils.r_button_img),
          buildListItm(
              ImageUtils.past_img,
              StringUtils.note_templete,
              StringUtils.in_commend,
              ImageUtils.command_img,
              ImageUtils.button_4_img),
          buildListItm(
              ImageUtils.person_img,
              StringUtils.add_persong,
              StringUtils.partners,
              ImageUtils.command_img,
              ImageUtils.r_button_img),
          buildListItm(
              ImageUtils.person_img,
              StringUtils.manage_attribute,
              StringUtils.in_commend,
              ImageUtils.command_img,
              ImageUtils.h_button_img),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.black.withOpacity(0.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTempAndGoodMornigMessage(),
              Container(
                height: 100,
                width: 2,
                color: Colors.black.withOpacity(0.1),
              ),
              buildAgendaContainer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAllTabs() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageUtils.all_img,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(StringUtils.all, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                width: 50,
                height: 2,
                color: Colors.black,
              )
            ],
          ),
          buildOptionsList(ImageUtils.task_img, StringUtils.task),
          buildOptionsList(ImageUtils.list_img, StringUtils.list),
          buildOptionsList(ImageUtils.user_img, StringUtils.user),
          buildOptionsList(ImageUtils.filtter_img,StringUtils.filer),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 30,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
          child: Icon(Icons.search, color: Colors.black.withOpacity(0.5))),
      title: TextField(
        decoration: InputDecoration(
          hintText: StringUtils.tapSearch,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3)
          ),
          border: InputBorder.none,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          height: 2.0,
          width: double.infinity,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget buildAgendaContainer() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.event_note, color: Colors.orange),
              Text(
                StringUtils.agenda,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 12,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                StringUtils.meeting,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTempAndGoodMornigMessage() {
    return const Padding(
      padding: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.orange),
              Text(
                StringUtils.good_morning,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 12,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                StringUtils.sunny,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListItm(
      String img1, String title1, String title2, String img2, String img3) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Image.asset(
              img1,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title1), Text(title2)],
            ),
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                img2,
                height: 20,
              ),
              Image.asset(
                img3,
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOptionsList(String image, String title) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
