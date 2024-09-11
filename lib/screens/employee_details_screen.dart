import 'package:employee_management/extension/numExt.dart';
import 'package:employee_management/modals/employee_modal.dart';
import 'package:employee_management/widgets/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class EmployeeDetailsScreen extends StatefulWidget {
  EmployeeModel employee;
  EmployeeDetailsScreen({super.key, required this.employee});

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Employee Details"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          20.heightBox,
          const CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.person,
              size: 45,
            ),
          ),
          5.heightBox,
          Text(
            widget.employee.name.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          20.heightBox,
          Expanded(
            child: ListView(
              children: [
                ReusableRow(
                    title: "Email",
                    data: widget.employee.email == null
                        ? "Not Available "
                        : widget.employee.email.toString()),
                ReusableRow(
                    title: "Mobile",
                    data: widget.employee.mobile == null
                        ? "Not Available "
                        : widget.employee.mobile.toString()),
                ReusableRow(
                    title: "Country",
                    data: widget.employee.country == null
                        ? "Not Available "
                        : widget.employee.country.toString()),
                ReusableRow(
                    title: "State",
                    data: widget.employee.state == null
                        ? "Not Available "
                        : widget.employee.state.toString()),
                ReusableRow(
                    title: "District",
                    data: widget.employee.district == null
                        ? "Not Available "
                        : widget.employee.district.toString()),
                ReusableRow(
                    title: "Id",
                    data: widget.employee.id == null
                        ? "Not Available "
                        : widget.employee.id.toString()),
                ReusableRow(
                    title: "Email_Id",
                    data: widget.employee.emailId == null
                        ? "Not Available "
                        : widget.employee.emailId.toString()),
                ReusableRow(
                    title: "Created",
                    data: widget.employee.createdAt == null
                        ? "Not Available "
                        : widget.employee.createdAt.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
