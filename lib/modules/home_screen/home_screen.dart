import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home',style: Theme.of(context).textTheme.bodyText1,),
    );
  }
}
