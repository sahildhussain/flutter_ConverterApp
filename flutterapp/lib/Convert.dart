import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

final _padding = EdgeInsets.all(16.0);

class ConvertScreen extends StatefulWidget {
  final List<String> dropDownValues;
  final String type;

  @override
  State createState() => new Convert(dropDownValues, type);
  //State createState() => new Convert(dropDownValues);

  const ConvertScreen(
      {Key key, @required this.dropDownValues, @required this.type});
}

class Convert extends State<ConvertScreen> {
  final List<String> dropDownValues;
  final String type;
  String _choosenDropDownValue = null;
  String _choosenDropDownValue1 = null;
  Convert(this.dropDownValues, this.type);

  @override
  void initState() {
    _choosenDropDownValue = dropDownValues.elementAt(0);
    _choosenDropDownValue1 = dropDownValues.elementAt(1);
  } //initial state of DropDownMenu

  void _onChanged(String value) {
    setState(() {
      _choosenDropDownValue = value;
    });
  } //This function is invoked on changing the dropdown button value

  void _onChanged1(String value) {
    setState(() {
      _choosenDropDownValue1 = value;
    });
  } //This function is invoked on changing the dropdown button value

  @override
  Widget build(BuildContext context) {
    //

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(type + ' Converter'),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: _padding,
          child: Center(
            //PART1 Input+dropdown
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),color: Colors.blue[200]),
                  padding: _padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        style: Theme.of(context).textTheme.display1,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Input',
                          labelStyle: Theme.of(context).textTheme.display1,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          contentPadding: _padding,
                        ),
                      ),
                      Container(
                        padding: _padding,
                        decoration: BoxDecoration(
                          // This sets the color of the [DropdownButton] itself
                          color: Colors.grey[50],
                          border: Border.all(
                            color: Colors.grey[400],
                            width: 5.0,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: _choosenDropDownValue,
                              items: dropDownValues.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                _onChanged(value);
                              },
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //Part 2 swap icon
                IconButton(
                  padding: _padding,
                  onPressed: () {
                    print('Button was pressed.');
                  },
                  icon: Icon(
                    Icons.swap_vert,
                    size: 40.0,
                    color: Colors.black38,
                  ),
                ),

                //Part 3- Input+dropdown
                Container(
                  padding: _padding,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),color: Colors.blue[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      InputDecorator(
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        decoration: InputDecoration(
                            labelText: 'Output',
                            labelStyle: Theme.of(context).textTheme.display1,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0))),
                      ),
                      Container(
                        padding: _padding,
                        decoration: BoxDecoration(
                          // This sets the color of the [DropdownButton] itself
                          color: Colors.grey[50],
                          border: Border.all(
                            color: Colors.grey[400],
                            width: 5.0,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: _choosenDropDownValue1,
                              items: dropDownValues.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                _onChanged1(value);
                              },
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
