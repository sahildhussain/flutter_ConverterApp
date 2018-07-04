import 'package:flutter/material.dart';

//meta.dart is necessary for @required
import 'package:meta/meta.dart';
import 'Convert.dart';

const _height = 100.0;
final _borderRadius = BorderRadius.circular(_height/2);
final Map optionsPerCategory ={
  'Length': ['Metre','Feet'],
  'Area':['a1','a2'],
  'Volume':['v1','v2'],
  'Mass':['m1','m2'],
  'Time':['t1','t2'],
  'Speed':['s1','s2'],
  'Temperature':['Celcius','Kelin']
};

class Category extends StatelessWidget {
  final IconData iconLocation;
  final String name;
  final Color color;
  const Category({Key key, @required this.iconLocation, @required this.name, @required this.color})
      : assert(iconLocation != null),
        assert(name != null),
        assert(color!=null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: Container(
            height: _height,
            child: InkWell(
              borderRadius: _borderRadius,
              splashColor: color,
              highlightColor: color,
              onTap: () {
                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ConvertScreen(type: name ,dropDownValues: optionsPerCategory[name],)
                ));
                //TODO: Send a list of conversion for every tap
              },
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    /* Children of a widget contains list of another widgets
                    can be represented by [] or List()
                    */
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(iconLocation, size: 60.0),
                      ),
                      Center(
                          child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,
                      ))
                    ],
                  )),
            )),
    );
  }
}
