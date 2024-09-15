import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/home/widgets/menu_widget.dart';
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
  String dropdownValue = "Terpopuler";
  String time = "";
  List listWellness = [];
  var listDropdown;

  @override
  void initState() {
    listDropdown = dropdownList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ))
        .toList();

    listWellness = wellnessBox.get(0);
    final now = DateTime.now().hour;

    if (now >= 20 || now <= 5) {
      time = "Selamat Malam";
    } else if (now > 5 && now <= 10) {
      time = "Selamat Pagi";
    } else if (now > 10 && now <= 15) {
      time = "Selamat Siang";
    } else {
      time = "Selamat Sore";
    }

    super.initState();
  }

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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
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
                child: const Icon(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
            child: const CircleAvatar(
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
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      height: 50,
                      width: 1000,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            child: SizedBox(
                              height: 40,
                              child: Center(
                                child: Text("Payuung Pribadi"),
                              ),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 40,
                              child: Center(
                                child: Text("Payuung Karyawan"),
                              ),
                            ),
                          ),
                        ],
                        textScaler: const TextScaler.linear(0.9),
                        indicatorPadding:
                            const EdgeInsets.symmetric(vertical: 2),
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
                  const Text(
                    "Produk Keuangan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 210,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: produkKeuangan.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = produkKeuangan[index];
                        return MenuIconWidget(
                          menuName: item.name,
                          onTap: () {},
                          assetName: item.icon!,
                          isNewMenu: item.isNewMenu ?? false,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Kategori Pilihan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 25,
                        width: 105,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 4, left: 6),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Wishlist", style: TextStyle(fontSize: 16)),
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: kategoriPilihan.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = kategoriPilihan[index];
                        return MenuIconWidget(
                          menuName: item.name,
                          onTap: () {},
                          assetName: item.icon!,
                          isNewMenu: item.isNewMenu ?? false,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Explore Wellness",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 27,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            const EdgeInsets.only(top: 2, bottom: 4, left: 6),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          items: listDropdown,
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          underline: const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 280,
                              childAspectRatio: (2.13 / 3.6),
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemCount: listWellness.length,
                      itemBuilder: (context, index) {
                        var item = listWellness[index];
                        return Material(
                          color: Colors.white,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 150,
                                    child: Image.asset(
                                      item.image,
                                      filterQuality: FilterQuality.low,
                                    ),
                                  ),
                                  Text(item.name),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (item.isDiscount)
                                    Row(
                                      children: [
                                        Text(
                                          currencyFormatter
                                              .format(item.price)
                                              .replaceAll(',', '.'),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${(item.discount * 10).toInt()}% OFF",
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  Text(currencyFormatter
                                      .format(item.isDiscount
                                          ? item.price - (item.discount * 10000)
                                          : item.price)
                                      .replaceAll(',', '.'))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
        _buildDraggableSheet(context),
      ],
    );
  }

  _buildDraggableSheet(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.4,
      minChildSize: 0.1,
      initialChildSize: 0.1,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: 330,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: GridView.builder(
              itemCount: bottomNavbarMenu.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = bottomNavbarMenu[index];
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          item.icon!,
                          semanticsLabel: '',
                          height: 35,
                        ),
                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (6.13 / 4.2),
              ),
            ),
          ),
        );
      },
    );
  }
}
