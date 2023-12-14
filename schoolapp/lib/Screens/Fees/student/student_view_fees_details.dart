import 'package:flutter/material.dart';
import 'package:school_management_system/widget/appBar/appbar_widget.dart';
import 'package:school_management_system/widget/appBar/decorative_apbar_widget.dart';
import '../../../Models/Student/Fees/student_fee_response_model.dart';
import '../../../Services/api_services.dart';
import '../../../constants/style.dart';

class StudentSeeFees extends StatefulWidget {
  const StudentSeeFees({Key? key}) : super(key: key);

  @override
  State<StudentSeeFees> createState() => _StudentSeeFeesState();
}

class _StudentSeeFeesState extends State<StudentSeeFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.3,
        ),
        child: DecorativeAppBar(
          barHeight: MediaQuery.of(context).size.height * 0.24,
          barPad: MediaQuery.of(context).size.height * 0.19,
          radii: 30,
          background: Colors.white,
          gradient1: lightBlue,
          gradient2: deepBlue,
          extra: appbar("assets/flaticon/_fees.png", " Fees", context, () {
            Navigator.pop(context);
          }),
        ),
      ),
      body: FutureBuilder<StudentFeesDetailsModel>(
        future: ApiServices.viewFees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          } else {
            StudentFeesDetailsModel fees = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: fees.data!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: deepBlue),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey,
                              spreadRadius: 2,
                              offset: Offset(3, 5),
                            )
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(20),
                          title: Text(
                            "Class: ${fees.data![index].datumClass}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Admission Fees: "),
                                  Text("${fees.data![index].admissionFees}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tuition Fees: "),
                                  Text("${fees.data![index].tuitionFees}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Library Deposit: "),
                                  Text("${fees.data![index].libraryFees}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Transport Fees: "),
                                  Text("${fees.data![index].transportFees}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Exam Fees: "),
                                  Text("${fees.data![index].examinationFees}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Miscellaneous Fees: "),
                                  Text(
                                      "${fees.data![index].miscellaneousFees}"),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Fees ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("${fees.data![index].totalFees}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
