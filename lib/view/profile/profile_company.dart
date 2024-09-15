import 'package:flutter/material.dart';
import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/data/database_service.dart';
import 'package:payuung_pribadi/data/hive_database/company.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/profile/widgets/dropdown_widget.dart';
import 'package:payuung_pribadi/view/profile/widgets/textfield_widget.dart';

class ProfileCompany extends StatefulWidget {
  final Function previousPage;
  const ProfileCompany({super.key, required this.previousPage});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankBranchNameController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();

  String? position;
  String? professionalTime;
  String? incomeSource;
  String? grossIncome;
  @override
  void initState() {
    var company = companyBox.get(0);
    if (company != null) {
      var s = company as Company;

      _companyNameController.text = s.companyName;

      _companyAddressController.text = s.companyAddress;

      _bankNameController.text = s.bankName;
      _bankBranchNameController.text = s.bankBranchName;

      _accountNumberController.text = s.accountNumber;

      _accountNameController.text = s.accountName;

      position = s.position;
      professionalTime = s.professionalLifetime;
      incomeSource = s.incomeSource;
      grossIncome = s.incomeGrossSource;
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
              TextfieldWidget(
                controller: _companyNameController,
                label: "NAMA USAHA/PERUSAHAAN",
              ),
              TextfieldWidget(
                controller: _companyAddressController,
                label: "ALAMAT USAHA/PERUSAHAAN",
              ),
              DropdownWidget(
                label: "JABATAN",
                dropdownField: positionList,
                hintText: "Pilih",
                value: position,
                cbValue: (value) {
                  position = value!;
                },
              ),
              DropdownWidget(
                label: "LAMA BEKERJA",
                dropdownField: proffessionalTime,
                hintText: "Pilih",
                value: professionalTime,
                cbValue: (value) {
                  professionalTime = value!;
                },
              ),
              DropdownWidget(
                label: "SUMBER PENDAPATAN",
                dropdownField: incomeSourceList,
                hintText: "Pilih",
                value: incomeSource,
                cbValue: (value) {
                  incomeSource = value!;
                },
              ),
              DropdownWidget(
                label: "PENDAPATAN KOTOR PERTAHUN",
                dropdownField: grossIncomeList,
                hintText: "Pilih",
                value: grossIncome,
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
                                      side: const BorderSide(color: Colors.amber)),
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
                                var company = Company(
                                    companyName: _companyNameController.text,
                                    companyAddress:
                                        _companyAddressController.text,
                                    position: position ?? "",
                                    professionalLifetime:
                                        professionalTime ?? "",
                                    incomeSource: incomeSource ?? "",
                                    incomeGrossSource: grossIncome ?? "",
                                    bankName: _bankNameController.text,
                                    bankBranchName:
                                        _bankBranchNameController.text,
                                    accountNumber:
                                        _accountNumberController.text,
                                    accountName: _accountNameController.text);

                                BoxesServices.putDataCompany(company);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
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
