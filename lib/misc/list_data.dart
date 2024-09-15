import 'package:payuung_pribadi/model/menu_service_model.dart';
import 'package:payuung_pribadi/model/wellness_service_model.dart';

List<MenuServiceModel> produkKeuangan = [
  const MenuServiceModel(
      name: "Urun", icon: "assets/icons/urun.svg", isNewMenu: true),
  const MenuServiceModel(
      name: "Pembiayaan Porsi Haji", icon: "assets/icons/umrah_haji.svg"),
  const MenuServiceModel(
      name: "Financial Check Up", icon: "assets/icons/finance.svg"),
  const MenuServiceModel(name: "Asuransi Mobil", icon: "assets/icons/car.svg"),
  const MenuServiceModel(
      name: "Asuransi Properti", icon: "assets/icons/house.svg")
];

List<MenuServiceModel> kategoriPilihan = [
  const MenuServiceModel(name: "Hobi", icon: "assets/icons/hobi.svg"),
  const MenuServiceModel(
      name: "Merchandise", icon: "assets/icons/merchandise.svg"),
  const MenuServiceModel(
      name: "Gaya Hidup Sehat", icon: "assets/icons/health.svg"),
  const MenuServiceModel(
      name: "Konseling & Rohani", icon: "assets/icons/chat.svg"),
  const MenuServiceModel(
      name: "Self Development", icon: "assets/icons/self_development.svg"),
  const MenuServiceModel(
      name: "Perencanaan Keuangan", icon: "assets/icons/card.svg"),
  const MenuServiceModel(
      name: "Konsultasi Medis", icon: "assets/icons/medic.svg"),
  const MenuServiceModel(name: "Lihat Semua", icon: "assets/icons/see_all.svg")
];

List<MenuServiceModel> bottomNavbarMenu = [
  const MenuServiceModel(name: "Beranda", icon: "assets/icons/home_menu.svg"),
  const MenuServiceModel(name: "Cari", icon: "assets/icons/search_menu.svg"),
  const MenuServiceModel(name: "Keranjang", icon: "assets/icons/cart_menu.svg"),
  const MenuServiceModel(
      name: "Daftar Transaksi", icon: "assets/icons/order_menu.svg"),
  const MenuServiceModel(
      name: "Voucher Saya", icon: "assets/icons/voucher_menu.svg"),
  const MenuServiceModel(
      name: "Alamat Pengiriman", icon: "assets/icons/location_menu.svg"),
  const MenuServiceModel(
      name: "Daftar Teman", icon: "assets/icons/friend_menu.svg"),
];

List<WellnessServiceModel> exploreWellness = [
  const WellnessServiceModel(
      name: "Voucher Digital Indomaret Rp. 25.000",
      image: "assets/images/Logo_Indomaret.png",
      price: 25000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital H&M Rp. 100.000",
      image: "assets/images/h&m.jpg",
      price: 100000,
      discount: 0.3,
      isDiscount: true),
  const WellnessServiceModel(
      name: "Voucher Digital Grab Transport Rp. 20.000",
      image: "assets/images/Grab.jpg",
      price: 20000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital Excelso Rp. 50.000",
      image: "assets/images/Excelso.png",
      price: 50000,
      discount: 0.4,
      isDiscount: true),
  const WellnessServiceModel(
      name: "Voucher Digital Grab Transport Rp. 50.000",
      image: "assets/images/Grab.jpg",
      price: 50000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital Bakmi GM Rp. 100.000",
      image: "assets/images/Logo-Bakmi-GM.jpg",
      price: 100000,
      discount: 0.5,
      isDiscount: true),
];

final List<String> positionList = [
  "Non-Staf",
  "Staf",
  "Supervisor",
  "Manajer",
  "Direktur",
  "Lainnya"
];

final List<String> proffessionalTime = [
  "< 6 Bulan",
  "6 Bulan - 1 Tahun",
  "1-2 Tahun",
  "> 2 Tahun",
];

final List<String> incomeSourceList = [
  "Gaji",
  "Keuntungan Bisnis",
  "Bunga Tabungan",
  "Warisan",
  "Dana dari orang tua atau anak",
  "Undian",
  "Keuntungan Investasi",
  "Lainnya"
];

final List<String> grossIncomeList = [
  "< 10 Juta",
  "10-50 Juta",
  "50-100 Juta",
  "100-500 Juta",
  "500 Juta-1 Milyar",
  "> 1 Milyar"
];

List<String> dropdownList = [
  "Terpopuler",
  "A to Z",
  "Z to A",
  "Harga Terendah",
  "Harga Tertinggi"
];
