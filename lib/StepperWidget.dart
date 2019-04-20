import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';



class StepperWidget extends StatefulWidget {
  final List<Step> steps;
  final Function onFinish;
  final String nameBtnContinue;
  final String nameBtnBack;
  final String nameBtnFinished;
  
  StepperWidget({
    @required this.steps, 
    this.nameBtnContinue = "Continuar",
    this.nameBtnFinished = "Finalizar", 
    this.nameBtnBack = "Voltar", 
    @required this.onFinish
  });

  @override
  StepperWidgetState createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget> {
  final BehaviorSubject<int> _stepController = BehaviorSubject(seedValue: 0);
  
  @override
  void dispose() {
    _stepController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<int>(
        stream: _stepController.stream,
        builder: (BuildContext context, AsyncSnapshot<int> snap) {
          bool isFinished = _stepController.value < widget.steps.length -1;
          if(snap.hasData)
          return Stepper(
            currentStep: snap.data,
            steps: widget.steps,
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: isFinished ? onStepContinue : widget.onFinish,
                    child: isFinished ? Text(widget.nameBtnContinue) : Text(widget.nameBtnFinished),
                  ),
                  snap.data > 0 ? FlatButton(
                    onPressed: onStepCancel,
                    child: Text(widget.nameBtnBack, style: TextStyle(color: Theme.of(context).accentColor,)),
                  ) : Text(""),
                ],
              );
            },
            onStepTapped: _stepController.sink.add,
            onStepCancel: () => snap.data > 0 ? _stepController.add(snap.data-1) : _stepController.add(0),
            onStepContinue: () => snap.data < widget.steps.length-1 ? _stepController.add(snap.data+1) : _stepController.add(0),
          );
          return Text("");
        }
      )
    );
  }
  

}