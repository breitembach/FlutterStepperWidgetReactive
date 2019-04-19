import 'package:flutter/material.dart';
import 'package:stepreactive/StepperWidget.dart';
import 'package:stepreactive/stepsData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Steps DEMO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StepperWidget(steps: stepsData, onFinish: onFinishedExec),
    );
  }

  Future<void> onFinishedExec() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Finalizar Steps?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Finalizar"),
            onPressed: (){},
          ),
          FlatButton(
            child: Text("Voltar"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }
}
