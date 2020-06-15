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

class _NativeFlutterState extends State<NativeFlutter> {


  Future<void> callFunc() async{
    dynamic number = <String, dynamic>{"number":"010-1234-4321"};
    final _callFuncMethod = const MethodChannel("samples.flutter.dev/action");
    var r = await _callFuncMethod.invokeMethod("callFunc", number);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("call"),
              onPressed: callFunc,
            )
          ],
        ),
      ),
    );
  }
}
