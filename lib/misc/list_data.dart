import 'package:payuung_pribadi/model/menu_service_model.dart';
import 'package:payuung_pribadi/model/wellness_service_model.dart';

List<MenuServiceModel> produkKeuangan = [
  const MenuServiceModel(name: "Urun", icon: "", isNewMenu: true),
  const MenuServiceModel(name: "Pembiayaan Porsi Haji", icon: ""),
  const MenuServiceModel(name: "Financial Check Up", icon: ""),
  const MenuServiceModel(name: "Asuransi Mobil", icon: ""),
  const MenuServiceModel(name: "Asuransi Properti", icon: "")
];

List<MenuServiceModel> kategoriPilihan = [
  const MenuServiceModel(name: "Hobi", icon: ""),
  const MenuServiceModel(name: "Merchandise", icon: ""),
  const MenuServiceModel(name: "Gaya Hidup Sehat", icon: ""),
  const MenuServiceModel(name: "Konseling & Rohani", icon: ""),
  const MenuServiceModel(name: "Self Development", icon: ""),
  const MenuServiceModel(name: "Perencanaan Keuangan", icon: ""),
  const MenuServiceModel(name: "Konsultasi Medis", icon: ""),
  const MenuServiceModel(name: "Lihat Semua", icon: "")
];

List<MenuServiceModel> bottomNavbarMenu = [
  const MenuServiceModel(name: "Beranda", icon: ""),
  const MenuServiceModel(name: "Cari", icon: ""),
  const MenuServiceModel(name: "Keranjang", icon: ""),
  const MenuServiceModel(name: "Daftar Transaksi", icon: ""),
  const MenuServiceModel(name: "Voucher Saya", icon: ""),
  const MenuServiceModel(name: "Alamat Pengiriman", icon: ""),
  const MenuServiceModel(name: "Daftar Teman", icon: ""),
];

List<WellnessServiceModel> exploreWellness = [
  const WellnessServiceModel(
      name: "Voucher Digital Indomaret Rp. 25.000",
      image: "",
      price: 25000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital H&M Rp. 100.000",
      image: "",
      price: 97000,
      discount: 0.3,
      isDiscount: true),
  const WellnessServiceModel(
      name: "Voucher Digital Grab Transport Rp. 20.000",
      image: "",
      price: 20000,
      discount: 0.4,
      isDiscount: true),
  const WellnessServiceModel(
      name: "Voucher Digital Excelso Rp. 50.000",
      image: "",
      price: 48000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital Grab Transport Rp. 50.000",
      image: "",
      price: 50000,
      discount: 0,
      isDiscount: false),
  const WellnessServiceModel(
      name: "Voucher Digital Bakmi GM Rp. 100.000",
      image: "",
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
