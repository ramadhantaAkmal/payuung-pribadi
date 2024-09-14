import 'package:flutter/material.dart';
import 'package:payuung_pribadi/view/profile/widgets/datepicker_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/dropdown_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/textfield_widget.dart';

class ProfileBiodata extends StatelessWidget {
  final Function nextPage, previousPage;
  const ProfileBiodata(
      {super.key, required this.nextPage, required this.previousPage});

  @override
  Widget build(BuildContext context) {
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

    return Container(
      padding: EdgeInsets.all(8),
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
                value: "Laki-laki",
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
                cbValue: (value) {
                  education = value!;
                },
              ),
              DropdownWidget(
                label: "STATUS PERNIKAHAN",
                dropdownField: maritalList,
                hintText: "Pilih",
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
                      onPressed: () async {
                        /* With go_router */
                        nextPage();
                      },
                      child: Text(
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
