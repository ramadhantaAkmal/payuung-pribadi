import 'package:flutter/material.dart';
import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/data/database_service.dart';
import 'package:payuung_pribadi/data/hive_database/biodata.dart';
import 'package:payuung_pribadi/view/profile/widgets/datepicker_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/dropdown_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/textfield_widget.dart';

class ProfileBiodata extends StatefulWidget {
  final Function nextPage, previousPage;
  const ProfileBiodata(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  State<ProfileBiodata> createState() => _ProfileBiodataState();
}

class _ProfileBiodataState extends State<ProfileBiodata> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(text: "test@gmail.com");

  String gender = "";
  String education = "";
  String maritalStatus = "";

  final List<String> genderList = ["Laki-laki", "Perempuan"];
  final List<String> educationList = [
    "SD",
    "SMP",
    "SMA",
    "D1",
    "D2",
    "D3",
    "S1",
    "S2",
    "S3"
  ];
  final List<String> maritalList = [
    "Belum Kawin",
    "Kawin",
    "Janda",
    "Duda",
  ];

  @override
  void initState() {
    var biodata = biodataBox.get(0);
    if (biodata != null) {
      var s = biodata as Biodata;

      _nameController.text = s.name;
      _birthDateController.text = s.birthDate.toString().substring(0, 10);
      _phoneNumController.text = s.phoneNumber;
      gender = s.gender;
      education = s.education;
      maritalStatus = s.maritalStatus;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // height: MediaQuery.sizeOf(context).height,
      // width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextfieldWidget(
                controller: _nameController,
                label: "NAMA LENGKAP",
                isRequired: true,
              ),
              DatepickerWidget(
                controller: _birthDateController,
                label: "TANGGAL LAHIR",
                isRequired: true,
              ),
              DropdownWidget(
                label: "JENIS KELAMIN",
                dropdownField: genderList,
                isRequired: true,
                value: gender == "" ? null : gender,
                hintText: "Pilih",
                cbValue: (value) {
                  gender = value!;
                },
              ),
              TextfieldWidget(
                controller: _emailController,
                label: "ALAMAT EMAIL",
                isRequired: true,
                readOnly: true,
              ),
              TextfieldWidget(
                controller: _phoneNumController,
                label: "NO. HP",
                isRequired: true,
                hintText: "Contoh: 081234567xxx",
              ),
              DropdownWidget(
                label: "PENDIDIKAN",
                dropdownField: educationList,
                hintText: "Pilih",
                value: education == "" ? null : education,
                cbValue: (value) {
                  education = value!;
                },
              ),
              DropdownWidget(
                label: "STATUS PERNIKAHAN",
                dropdownField: maritalList,
                hintText: "Pilih",
                value: maritalStatus == "" ? null : maritalStatus,
                cbValue: (value) {
                  maritalStatus = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  height: 20 * 2.5,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.amber),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var biodata = Biodata(
                              name: _nameController.text,
                              birthDate:
                                  DateTime.parse(_birthDateController.text),
                              gender: gender,
                              email: _emailController.text,
                              phoneNumber: _phoneNumController.text,
                              education: education,
                              maritalStatus: maritalStatus);

                          BoxesServices.putDataBiodata(biodata);
                          widget.nextPage();
                        }
                      },
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
