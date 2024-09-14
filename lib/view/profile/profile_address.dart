import 'package:flutter/material.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/profile/widgets/datepicker_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/dropdown_widget.dart';
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
  bool isAddressDomicile = true;
  @override
  Widget build(BuildContext context) {
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

    return Container(
      padding: EdgeInsets.all(8),
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
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(13),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Upload KTP",
                                style: TextStyle(fontSize: 16),
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
                controller: _provinceController,
                label: "KOTA/KABUPATEN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _provinceController,
                label: "KECAMATAN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _provinceController,
                label: "KELURAHAN",
                isRequired: true,
              ),
              TextfieldWidget(
                controller: _provinceController,
                label: "KODE POS",
                isRequired: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isAddressDomicile,
                    onChanged: (value) {
                      setState(() {
                        isAddressDomicile = value!;
                      });
                    },
                  ),
                  Text("Alamat domisili sama dengan alamat KTP"),
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
                      controller: _provinceDomicileController,
                      label: "KOTA/KABUPATEN",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _provinceDomicileController,
                      label: "KECAMATAN",
                      isRequired: true,
                    ),
                    TextfieldWidget(
                      controller: _provinceDomicileController,
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
                                      side: BorderSide(color: Colors.amber)),
                                ),
                              ),
                              onPressed: () async {
                                widget.previousPage();
                              },
                              child: Text(
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
                                widget.nextPage();
                              },
                              child: Text(
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
}
