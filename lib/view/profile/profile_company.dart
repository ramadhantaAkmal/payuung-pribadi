import 'package:flutter/material.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/profile/widgets/datepicker_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/dropdown_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/textfield_widget.dart';

class ProfileCompany extends StatelessWidget {
  final Function previousPage;
  const ProfileCompany({super.key, required this.previousPage});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _companyNameController =
        TextEditingController();
    final TextEditingController _companyAddressController =
        TextEditingController();
    final TextEditingController _bankNameController = TextEditingController();
    final TextEditingController _bankBranchNameController =
        TextEditingController();
    final TextEditingController _accountNumberController =
        TextEditingController();
    final TextEditingController _accountNameController =
        TextEditingController();

    String position = "";
    String professionalTime = "";
    String incomeSource = "";
    String grossIncome = "";

    return Container(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextfieldWidget(
                controller: _companyNameController,
                label: "NAMA USAHA/PERUSAHAAN",
              ),
              DatepickerWidget(
                controller: _companyAddressController,
                label: "ALAMAT USAHA/PERUSAHAAN",
              ),
              DropdownWidget(
                label: "JABATAN",
                dropdownField: positionList,
                hintText: "Pilih",
                cbValue: (value) {
                  position = value!;
                },
              ),
              DropdownWidget(
                label: "LAMA BEKERJA",
                dropdownField: proffessionalTime,
                hintText: "Pilih",
                cbValue: (value) {
                  professionalTime = value!;
                },
              ),
              DropdownWidget(
                label: "SUMBER PENDAPATAN",
                dropdownField: incomeSourceList,
                hintText: "Pilih",
                cbValue: (value) {
                  incomeSource = value!;
                },
              ),
              DropdownWidget(
                label: "PENDAPATAN KOTOR PERTAHUN",
                dropdownField: grossIncomeList,
                hintText: "Pilih",
                cbValue: (value) {
                  grossIncome = value!;
                },
              ),
              TextfieldWidget(
                controller: _bankNameController,
                label: "NAMA BANK",
              ),
              TextfieldWidget(
                controller: _bankBranchNameController,
                label: "CABANG BANK",
              ),
              TextfieldWidget(
                controller: _accountNumberController,
                label: "NOMOR REKENING",
              ),
              TextfieldWidget(
                controller: _accountNameController,
                label: "NAMA PEMILIK REKENING",
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
                                previousPage();
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
                              onPressed: () async {},
                              child: Text(
                                "Simpan",
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
