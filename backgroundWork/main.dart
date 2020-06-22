import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
    MaterialApp(
      home: NativeFlutter(),
    )
);

class NativeFlutter extends StatefulWidget {
  @override
  _NativeFlutterState createState() => _NativeFlutterState();
}

class _NativeFlutterState extends State<NativeFlutter> with WidgetsBindingObserver{

  final _callFuncMethod = const MethodChannel("samples.flutter.dev/action");

  Future<void> backgroundServiceFunc() async => await _callFuncMethod.invokeMethod("backgroundServiceFunc");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("background(Service&Thread)"),
              onPressed: this.backgroundServiceFunc,
            ),
          ],
        ),
      ),
    );
  }
}
