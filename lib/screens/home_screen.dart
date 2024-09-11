import 'package:employee_management/modals/employee_modal.dart';
import 'package:employee_management/screens/employee_details_screen.dart';
import 'package:employee_management/services/employee_services.dart';
import 'package:employee_management/widgets/flexible_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EmployeeServices employeeServices = EmployeeServices();
  TextEditingController searchController = TextEditingController();
  late List<EmployeeModel> employees;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("exit app"),
              content: Text(
                "do you want to exit?",
              ),
              actions: [
                FlexiableRectangularButton(
                    title: "no",
                    width: 70,
                    height: 25,
                    color: Colors.amber,
                    onPress: () {
                      Navigator.of(context).pop(false);
                    }),
                FlexiableRectangularButton(
                    title: "yes",
                    width: 70,
                    height: 25,
                    color: Colors.amber,
                    onPress: () {
                      SystemNavigator.pop();
                    })
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(value);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Employee Data"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search by Id",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: employeeServices.fetchEmployeeData(),
                  builder:
                      (context, AsyncSnapshot<List<EmployeeModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      employees = snapshot.data!;
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          EmployeeModel employee = snapshot.data![index];
                          if (searchController.text.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmployeeDetailsScreen(
                                                  employee: employee,
                                                )));
                                  },
                                  leading: const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        "https://media.istockphoto.com/id/1393750072/vector/flat-white-icon-man-for-web-design-silhouette-flat-illustration-vector-illustration-stock.jpg?s=612x612&w=0&k=20&c=s9hO4SpyvrDIfELozPpiB_WtzQV9KhoMUP9R9gVohoU="),
                                  ),
                                  title: Text(employee.name.toString()),
                                  titleTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  subtitle: Text(employee.id.toString()),
                                ),
                              ),
                            );
                          }
                          // next condition according to searching
                          else if (employee.id
                                  .toString()
                                  .contains(searchController.text.toString()) ||
                              employee.name
                                  .toString()
                                  .contains(searchController.text.toString())) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmployeeDetailsScreen(
                                                  employee: employee,
                                                )));
                                  },
                                  leading: const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        "https://media.istockphoto.com/id/1393750072/vector/flat-white-icon-man-for-web-design-silhouette-flat-illustration-vector-illustration-stock.jpg?s=612x612&w=0&k=20&c=s9hO4SpyvrDIfELozPpiB_WtzQV9KhoMUP9R9gVohoU="),
                                  ),
                                  title: Text(employee.name.toString()),
                                  titleTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  subtitle: Text(employee.id.toString()),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    }
                    return const SizedBox(
                      child: Center(child: Text("No data ")),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
