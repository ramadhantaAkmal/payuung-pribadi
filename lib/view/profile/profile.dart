import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/view/profile/profile_address.dart';
import 'package:payuung_pribadi/view/profile/profile_biodata.dart';
import 'package:payuung_pribadi/view/profile/profile_company.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int activeStep = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Informasi Pribadi"),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          child: EasyStepper(
            activeStep: activeStep,
            stepShape: StepShape.circle,
            alignment: Alignment.center,
            lineStyle: LineStyle(
              lineLength: 125,
              lineSpace: 0,
              lineType: LineType.normal,
              defaultLineColor: Colors.amber.shade100,
              finishedLineColor: Colors.amber,
              lineThickness: 2,
              progress: 0.5,
              progressColor: Colors.amber,
            ),
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 0,
            showLoadingAnimation: false,
            stepRadius: 20,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber.shade100,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        activeStep >= 0 ? Colors.amber : Colors.amber.shade100,
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                customTitle: const Center(
                  child: Text(
                    "Biodata Diri",
                    style: TextStyle(fontSize: 14, color: Colors.amber),
                  ),
                ),
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber.shade100,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        activeStep >= 1 ? Colors.amber : Colors.amber.shade100,
                    child: const Text("2", style: TextStyle(color: Colors.white)),
                  ),
                ),
                customTitle: const Center(
                  child: Text(
                    "Alamat\nPribadi",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.amber),
                  ),
                ),
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber.shade100,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        activeStep >= 2 ? Colors.amber : Colors.amber.shade100,
                    child: const Text("3", style: TextStyle(color: Colors.white)),
                  ),
                ),
                customTitle: const Center(
                  child: Text(
                    "Informasi\nPerusahaan",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.amber),
                  ),
                ),
              ),
            ],
            onStepReached: (index) {
              setState(() {
                activeStep = index;
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.bounceIn);
              });
            },
          ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProfileBiodata(
                  nextPage: nextPage,
                  previousPage: previousPage,
                ),
                ProfileAddress(
                  nextPage: nextPage,
                  previousPage: previousPage,
                ),
                ProfileCompany(previousPage: previousPage),
              ],
            ),
          ),
        )
      ],
    );
  }

  void nextPage() {
    setState(() {
      activeStep++;
      _pageController.animateToPage(activeStep,
          duration: const Duration(milliseconds: 1), curve: Curves.bounceIn);
    });
  }

  void previousPage() {
    setState(() {
      activeStep--;
      _pageController.animateToPage(activeStep,
          duration: const Duration(milliseconds: 1), curve: Curves.bounceIn);
    });
  }
}
