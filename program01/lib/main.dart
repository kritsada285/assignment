import 'package:assignment/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String invalidValue = '0';
  String _day = '1';
  String _month = '1';
  String _year = '1990';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Day:',
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: _day,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (text) {
                              setState(() {
                                _day =
                                    (int.tryParse(text) != null ? text : invalidValue);
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'dd', border: OutlineInputBorder())),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Month:',
                        ),
                        TextFormField(
                            initialValue: _month,
                            onChanged: (text) {
                              setState(() {
                                _month =
                                    (int.tryParse(text) != null ? text : invalidValue);
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'mm', border: OutlineInputBorder())),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Year:',
                        ),
                        TextFormField(
                            initialValue: _year,
                            onChanged: (text) {
                              setState(() {
                                _year =
                                    (int.tryParse(text) != null ? text : invalidValue);
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'yyyy',  border: OutlineInputBorder())),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                isValidDate(
                        int.parse(_day), int.parse(_month), int.parse(_year))
                    ? getWeekday(
                        int.parse(_day), int.parse(_month), int.parse(_year))
                    : 'Invalid date',
                style: const TextStyle(fontSize: 32.0),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
