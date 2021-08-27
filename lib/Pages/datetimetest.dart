import 'package:flutter/material.dart';

class DateTimeTest extends StatefulWidget {
  const DateTimeTest({ Key? key }) : super(key: key);

  @override
  _DateTimeTestState createState() => _DateTimeTestState();
}

class _DateTimeTestState extends State<DateTimeTest> {

  final GlobalKey<FormState> dobkey = GlobalKey<FormState>();

  DateTime? _dateAndTime = DateTime.now();

  Future<Null> _selectDOB(BuildContext context) async {
    DateTime? _dobPicker = await showDatePicker(   
      context: context,
      initialDate: _dateAndTime!, // Current Date
      firstDate: DateTime(1947), // First Date
      lastDate: DateTime(2022), // Last Date
      textDirection: TextDirection.ltr,
      initialDatePickerMode: DatePickerMode.day,
      selectableDayPredicate: (DateTime val) =>
          val.weekday == 6 || val.weekday == 7 ? false : true,
    );

    if (_dobPicker != null && _dobPicker != _dateAndTime) {
      setState(() {
        _dateAndTime = _dobPicker;
        print(
          _dateAndTime.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text("DOB Picker Demo"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(  
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.redAccent,
        child: Form(  
          key: dobkey,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/12,
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,   
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width/40)),
              ),  
              child: Center(
                child: TextField(  
                  readOnly: true,
                          onTap: () {
                            setState(() {
                              _selectDOB(context);
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            labelText: "DOB",
                            //hintText: (_dateAndTime.toString()),
                            hintText: ("${_dateAndTime?.day}-${_dateAndTime?.month}-${_dateAndTime?.year}"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 40),
                                borderSide: BorderSide(color: Colors.black87)),
                          ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}