import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final currencyFormatter = NumberFormat.currency(
    symbol: "Rp.",
    decimalDigits: 0,
  );
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: _buildBody(context),
        backgroundColor: Colors.amber,
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Malam",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "User",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            onPressed: () {},
            icon: Badge.count(
                isLabelVisible: true,
                count: 0,
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(
                "A",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.amber,
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Tabbar widget
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      height: 50,
                      width: 1000,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Text("Payuung Pribadi"),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Text("Payuung Karyawan"),
                              ),
                            ),
                          ),
                        ],
                        indicatorPadding: EdgeInsets.symmetric(vertical: 2),
                        indicator: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  //Produk keuangan
                  Text(
                    "Produk Keuangan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: produkKeuangan.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.white,
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    produkKeuangan[index].name,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Kategori Pilihan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: kategoriPilihan.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.white,
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    kategoriPilihan[index].name,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Explore Wellness",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 280,
                          childAspectRatio: (2.13 / 3.6),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount: exploreWellness.length,
                      itemBuilder: (context, index) {
                        return Material(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 25,
                                  color: Colors.grey,
                                ),
                                Text(exploreWellness[index].name),
                                Text(currencyFormatter
                                    .format(exploreWellness[index].price)
                                    .replaceAll(',', '.'))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   color: Colors.black,
        // ),
        _buildDraggableSheet(context),
      ],
    );
  }

  _buildDraggableSheet(BuildContext context) {
    return Container(
      child: DraggableScrollableSheet(
        maxChildSize: 0.4,
        minChildSize: 0.1,
        initialChildSize: 0.1,
        snap: true,
        // shouldCloseOnMinExtent: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            child: Container(
              height: 330,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: GridView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            bottomNavbarMenu[index].name,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (6.13 / 4.2),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
