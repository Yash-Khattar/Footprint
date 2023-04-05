import 'package:flutter/material.dart';

import '../coupons.dart';
import '../const.dart';

class RewardPage extends StatefulWidget {
  final userCoins;

  RewardPage([this.userCoins = 40]);

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  // int currentPageIndex = 0;
  late TabController _tabController;
  int activeTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    void setActiveTabIndex() {
      setState(() {
        activeTabIndex = _tabController.index;
      });
    }

    _tabController.addListener(setActiveTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/textlogo_grey.png",
                      height: 40,
                      width: 115,
                    ),
                    const Icon(
                      Icons.more_vert_rounded,
                      color: kgreyColor,
                      size: 22,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Rewards",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: kgreyColor),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black12,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kwhiteColor)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 8, 22, 8),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: kwhiteColor,
              //       borderRadius: BorderRadius.all(Radius.circular(15)),
              //       boxShadow: [
              //         BoxShadow(
              //           blurRadius: 10,
              //           spreadRadius: 1,
              //           color: Color.fromARGB(255, 243, 240, 240),
              //         )
              //       ],
              //     ),
              //     height: 125,
              //     width: double.infinity,
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 30, vertical: 15),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Icon(
              //             Icons.monetization_on,
              //             color: kgreenColor,
              //             size: 90,
              //           ),
              //           SizedBox(width: 50),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "Coins",
              //                 style: TextStyle(
              //                     color: kgreyColor,
              //                     fontSize: 26,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //               SizedBox(height: 10),
              //               Text(
              //                 "40 FP",
              //                 style: TextStyle(color: kgreyColor, fontSize: 20),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   elevation: 7,
              //   color: kgreyColor,
              //   child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //       margin: EdgeInsets.symmetric(horizontal: 5),
              //       child: Column(
              //         // crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Reedem Coupons or shop for Health Products.",
              //             style: TextStyle(color: kwhiteColor, fontSize: 17),
              //           ),
              //           const SizedBox(
              //             height: 30,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Text(
              //                 "COINS:",
              //                 style: TextStyle(fontSize: 35, color: kwhiteColor),
              //               ),
              //               Text(
              //                 widget.userCoins.toString(),
              //                 style: TextStyle(
              //                     color: kgreenColor,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 35),
              //               )
              //             ],
              //           ),
              //         ],
              //       )),
              // ),
              // TabBar(
              //   controller: _tabController,
              //   indicatorColor: kgreenColor,
              //   labelColor: kgreyColor,
              //   splashFactory: InkSparkle.splashFactory,
              //   tabs: const <Widget>[
              //     Tab(
              //       text: "Coupon",
              //       icon: Icon(Icons.discount),
              //     ),
              //     Tab(
              //       text: "Products",
              //       icon: Icon(Icons.shopping_cart),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black12,
                    //     blurRadius: 3.0,
                    //     // spreadRadius: 0.5,
                    //     offset: Offset(1.0, 1.0),
                    //   )
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              'Coupons',
                              style: TextStyle(
                                  color: activeTabIndex == 0
                                      ? kwhiteColor
                                      : kgreyColor),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Products',
                              style: TextStyle(
                                  color: activeTabIndex == 1
                                      ? kwhiteColor
                                      : kgreyColor),
                            ),
                          ),
                        ],
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kgreenColor,
                        ),
                        controller: _tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Center(
                      child: CouponList(),
                    ),
                    Center(
                      child: ProductList(),
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
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80, // Change
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyHealthProducts
            .map((data) =>
                ProductCard(data.title, data.imageUrl, data.donations))
            .toList(),
      ),
    );
  }
}

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80, // Change
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: coupons
            .map((data) =>
                ProductCard(data.title, data.imageUrl, data.donations))
            .toList(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String donation;

  ProductCard(this.title, this.imagePath, this.donation);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kgreyColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          height: 150,
          width: double.maxFinite,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          color: kgreyColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.maxFinite,
          child: RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(color: kwhiteColor, fontSize: 16),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: kgreenColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_rounded,
                  color: kwhiteColor,
                ),
                Container(
                  child: Text(
                    donation,
                    style: TextStyle(color: kwhiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
