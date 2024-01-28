import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    appBar: AppBar(title: Text('HomePage')),

    body: SafeArea(
      child: MyForm())
    );
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
  List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  String selectedOption = 'Option 1';

  // Text controllers for input boxes
  TextEditingController input1Controller = TextEditingController();
  TextEditingController input2Controller = TextEditingController();
  TextEditingController input3Controller = TextEditingController();
  TextEditingController input4Controller = TextEditingController();

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
                labelText: 'Select an option',
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Title'),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: input1Controller,
                            decoration: InputDecoration(
                              labelText: 'Input 1',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            controller: input2Controller,
                            decoration: InputDecoration(
                              labelText: 'Input 2',
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
                            controller: input3Controller,
                            decoration: InputDecoration(
                              labelText: 'Input 3',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            controller: input4Controller,
                            decoration: InputDecoration(
                              labelText: 'Input 4',
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