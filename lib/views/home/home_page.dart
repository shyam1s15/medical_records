import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage')),
        body: SafeArea(child: MyForm()));
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Date fixed from code
  DateTime fixedDate = DateTime.now();

  // Drop-down options
  List<String> dropdownOptions = ['Full Opd', 'Half Opd', 'No Opd'];
  String selectedOption = 'Full Opd';

  // Text controllers for input boxes
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    input1Controller.text = '0';
    input2Controller.text = '0';
    input3Controller.text = '0';
    input4Controller.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fixed Date: ${fixedDate.toLocal()}'),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedOption,
              items: dropdownOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select an Opd',
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0-15 Years'),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: input1Controller,
                            decoration: InputDecoration(
                              labelText: 'Old Male',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: input2Controller,
                            decoration: InputDecoration(
                              labelText: 'Old Female',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: input3Controller,
                            decoration: InputDecoration(
                              labelText: 'New Male',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: input4Controller,
                            decoration: InputDecoration(
                              labelText: 'New Female',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                print('Form Submitted');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
