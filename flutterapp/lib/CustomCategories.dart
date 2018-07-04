//File not in used for now.. might use this in future.

import 'package:flutter/material.dart';
import 'category.dart';
import 'main.dart';


Widget customCategories()
{
  if(true){
  return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categoryList[index],
      itemCount: categoryList.length
  );
  }
  else
    {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: categoryList,
      );
    }

}
/*class customScrollView extends StatelessWidget{

  final Map categoryList;

  const customScrollView(
      { Key key1,
        @required this.categoryList}
        ):assert(categoryList!=null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        //Text('Hello',style: Theme.of(context).textTheme.headline),
        //Text('Buddy',style: Theme.of(context).textTheme.headline)
        Category(
          name: 'Volume',
          iconLocation: Icons.local_cafe,
        ),
        /*Category(
          name: 'Time',
          iconLocation: Icons.watch_later,
        )*/
      ],
    );
  }
}

*/