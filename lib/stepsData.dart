import 'package:flutter/material.dart';

List<Step> get stepsData {
  return List<Step>.from([
    Step(
        // Title of the Step
        title: Text("Step 1"),
        // Content, it can be any widget here. Using basic Text for this example
        content: Text("Hello!"),
        isActive: true),
    Step(
        title: Text("Step 2"),
        content: Text("World!"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    Step(
        title: Text("Step 3"),
        content: Text("Hello World!"),
        isActive: true),
  ]);
}