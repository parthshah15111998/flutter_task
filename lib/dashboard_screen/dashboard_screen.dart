import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/dashboard_screen/dashboard_appbar.dart';
import 'package:parth_shah_task_1/dashboard_screen/dashboard_provider/dashboard_provider.dart';
import 'package:parth_shah_task_1/dashboard_screen/revenue_widget.dart';
import 'package:parth_shah_task_1/search_screen/search_screen.dart';
import 'package:parth_shah_task_1/utils/color.dart';
import 'package:parth_shah_task_1/utils/image.dart';
import 'package:parth_shah_task_1/utils/string.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUpdateContainer(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildFilterContainer(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: buildImportExportContainer(),
                  )
                ],
              ),
              buildSalesDetails(
                  dashboardProvider: dashboardProvider,
                  image1: ImageUtils.total_sale_img,
                  title: StringUtils.totalSale,
                  price: "\$${dashboardProvider.totalSales}",
                  secondPrice: "10,5 %",
                  image2: ImageUtils.up_img,
                  color: ColorUtils.saleColor),
              buildSalesDetails(
                  dashboardProvider: dashboardProvider,
                  image1: ImageUtils.avg_vale_img,
                  title: StringUtils.avgValue,
                  price: "\$${dashboardProvider.avgSale}",
                  secondPrice: "3,4 %",
                  image2: ImageUtils.up_img,
                  color: ColorUtils.saleColor),
              buildSalesDetails(
                  dashboardProvider: dashboardProvider,
                  image1: ImageUtils.total_del_img,
                  title: StringUtils.totalDeals,
                  price: "${dashboardProvider.totalDeals}",
                  secondPrice: "0,5 %",
                  image2: ImageUtils.down_1_img,
                  color: ColorUtils.downSaleColor),
              const SizedBox(height: 20),
              RevenueWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Row(
                        children: [
                          Icon(Icons.perm_identity),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              StringUtils.contactText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchScreen()),
                              );
                            },
                            child: Image.asset(
                              ImageUtils.search_img,
                              height: 40,
                            )),
                        Image.asset(
                          ImageUtils.referesh_2_img,
                          height: 40,
                        )
                      ],
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (value) {
                                    value = false;
                                  },
                                  activeColor: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(StringUtils.personText)
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 35),
                              child: const Text(StringUtils.companytext)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Column(
                      children: [
                        buildContactTile(ImageUtils.user_1_img,
                            "Jenny Wilson", "Facebook"),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        buildContactTile(ImageUtils.user_2_img,
                            "Jenny Wilson", "Facebook"),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        buildContactTile(ImageUtils.user_1_img,
                            "Jenny Wilson", "Facebook"),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        buildContactTile(ImageUtils.user_2_img,
                            "Jenny Wilson", "Facebook"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactTile(String image, String name, String company) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {
                      value = false;
                    },
                    activeColor: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 25,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(name)
              ],
            ),
            Container(
                margin: const EdgeInsets.only(right: 35), child: Text(company)),
          ],
        ),
      ),
    );
  }

  Widget buildTaskTile(
    String title,
    String description,
    String date,
    String category1,
    String category2,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          const SizedBox(height: 4),
          Row(
            children: [
              Chip(label: Text(category1)),
              const SizedBox(width: 8),
              Chip(label: Text(category2)),
            ],
          ),
        ],
      ),
      trailing: Text(date),
    );
  }

  Widget buildSalesDetails(
      {required DashboardProvider dashboardProvider,
      required String image1,
      required String title,
      required String price,
      required String secondPrice,
      required String image2,
      required Color color}) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.black.withOpacity(0.1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image1,
                  height: 35,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    Image.asset(
                      ImageUtils.right_circle_img,
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 35.0,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2.0,
                ),
              ),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13)),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image2,
                      height: 15,
                      color: color,
                    ),
                    Text(
                      secondPrice,
                      style: TextStyle(color: color),
                    )
                  ],
                ),
                Text(
                  StringUtils.periodText,
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImportExportContainer() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
          color: ColorUtils.signUpColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 2,
          )),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageUtils.download_img,
              height: 17,
            ),
            const SizedBox(
              width: 7,
            ),
            const Text(
              StringUtils.importExportText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Image.asset(
              ImageUtils.down_img,
              height: 17,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterContainer() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 2,
          )),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageUtils.filter_img,
              height: 17,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              StringUtils.filer,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff666D80),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUpdateContainer() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
            width: 2,
          )),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageUtils.calendar_img,
              height: 17,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              StringUtils.updateText1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorUtils.textFieldBackgoundColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              ImageUtils.referesh_img,
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
