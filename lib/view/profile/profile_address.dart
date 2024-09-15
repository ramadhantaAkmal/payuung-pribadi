
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/data/database_service.dart';
import 'package:payuung_pribadi/data/hive_database/address.dart';
import 'package:payuung_pribadi/view/profile/widgets/textfield_widget.dart';

class ProfileAddress extends StatefulWidget {
  final Function nextPage, previousPage;
  const ProfileAddress({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  @override
  State<ProfileAddress> createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  XFile? imagePicked;
  final ImagePicker _picker = ImagePicker();

  bool isAddressDomicile = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _regencyController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _kelurahanController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  final TextEditingController _addressDomicileController =
      TextEditingController();
  final TextEditingController _provinceDomicileController =
      TextEditingController();
  final TextEditingController _regencyDomicileController =
      TextEditingController();
  final TextEditingController _kecamatanDomicileController =
      TextEditingController();
  final TextEditingController _kelurahanDomicileController =
      TextEditingController();
  final TextEditingController _domicilePostalCodeController =
      TextEditingController();

  @override
  void initState() {
    var address = addressBox.get(0);
    if (address != null) {
      var s = address as Address;

      _nikController.text = s.nik;
      _addressController.text = s.address;
      _provinceController.text = s.province;
      _regencyController.text = s.city;
      _kecamatanController.text = s.kecamatan;
      _kelurahanController.text = s.kelurahan;
      _postalCodeController.text = s.postalCode;
      _addressDomicileController.text = s.domicileAddress ?? "";
      _provinceDomicileController.text = s.domicileProvince ?? "";
      _regencyDomicileController.text = s.domicileCity ?? "";
      _kecamatanDomicileController.text = s.domicileKecamatan ?? "";
      _kelurahanDomicileController.text = s.domicileKelurahan ?? "";
      _domicilePostalCodeController.text = s.domicilePostCode ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          _takeImage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/ktp.svg",
                                  semanticsLabel: '',
                                  height: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              imagePicked == null
                                  ? const Text(
                                      "Upload KTP",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  : Column(
                                      children: [
                                        const Text(
                                          "Upload KTP",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          imagePicked!.name.length > 10
                                              ? imagePicked!.name.substring(
                                                  imagePicked!.name.length - 10,
                                                  imagePicked!.name.length)
                                              : imagePicked!.name,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                              const Spacer(),
                              Visibility(
                                visible: imagePicked != null,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextfieldWidget(
                      controller: _nikController,
                      label: "NIK",
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              TextfieldWidget(
                controller: _addressController,
                label: "ALAMAT SESUAI KTP",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _provinceController,
                label: "PROVINSI",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _regencyController,
                label: "KOTA/KABUPATEN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _kecamatanController,
                label: "KECAMATAN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _kelurahanController,
                label: "KELURAHAN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _postalCodeController,
                label: "KODE POS",
                isRequired: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAddressDomicile,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        isAddressDomicile = value!;
                      });
                    },
                  ),
                  const Text("Alamat domisili sama dengan alamat KTP"),
                ],
              ),
              Visibility(
                visible: !isAddressDomicile,
                child: Column(
                  children: [
                    TextfieldWidget(
                      controller: _addressDomicileController,
                      label: "ALAMAT DOMISILI",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _provinceDomicileController,
                      label: "PROVINSI",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _regencyDomicileController,
                      label: "KOTA/KABUPATEN",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _kecamatanDomicileController,
                      label: "KECAMATAN",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _kelurahanDomicileController,
                      label: "KELURAHAN",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _domicilePostalCodeController,
                      label: "KODE POS",
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20 * 2.5,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      side: const BorderSide(
                                          color: Colors.amber)),
                                ),
                              ),
                              onPressed: () async {
                                widget.previousPage();
                              },
                              child: const Text(
                                "Sebelumnya",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.amber),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20 * 2.5,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    Colors.amber),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var address = Address(
                                    nik: _nikController.text,
                                    address: _addressController.text,
                                    province: _provinceDomicileController.text,
                                    city: _regencyController.text,
                                    kecamatan:
                                        _kecamatanDomicileController.text,
                                    kelurahan:
                                        _kelurahanDomicileController.text,
                                    postalCode: _postalCodeController.text,
                                    domicileAddress:
                                        _addressDomicileController.text,
                                    domicileCity:
                                        _regencyDomicileController.text,
                                    domicileKecamatan:
                                        _kecamatanDomicileController.text,
                                    domicileKelurahan:
                                        _kelurahanDomicileController.text,
                                    domicileProvince:
                                        _provinceDomicileController.text,
                                    domicilePostCode:
                                        _domicilePostalCodeController.text,
                                  );
                                  BoxesServices.putDataAddress(address);
                                  widget.nextPage();
                                }
                              },
                              child: const Text(
                                "Selanjutnya",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _takeImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                InkWell(
                  onTap: () async {
                    imagePicked =
                        await _picker.pickImage(source: ImageSource.camera);

                    setState(() {});
                  },
                  child: const SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.photo_camera),
                        Text(' Take picture from Camera '),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () async {
                    imagePicked =
                        await _picker.pickImage(source: ImageSource.gallery);

                    setState(() {});
                  },
                  child: const SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.photo_library),
                        Text(' Browse from gallery '),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
