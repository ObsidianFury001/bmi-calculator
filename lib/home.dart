import 'package:flutter/material.dart';
import 'app_constants.dart';
import 'widgets/bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  double _result = 0.0;
  String _message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    weightController.text = '0';
    heightController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator",
        ),
        elevation: 50,
        toolbarHeight: 90,
        centerTitle: true,
      ),
      backgroundColor: colorsDarkGray,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 75,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: weightController,
                  style: TextStyle(
                      fontSize: 35,
                      color: accent
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      hintText: "Weight",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      )
                  ),
                ),
              ),
              Container(
                width: 150,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  style: TextStyle(
                      fontSize: 35,
                      color: accent
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      hintText: "Height",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      )
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60,),
          Container(
            width: 250,
            height: 65,
            child: TextButton(
              onPressed: () {
                setState(() {
                  print("+++++++++++ Weight " + weightController.text.toString());
                  print("=========== Height " + heightController.text.toString());

                  var h = double.parse(heightController.text);
                  var w = double.parse(weightController.text);
                  if( h > 100 ){ h = h / 100; }
                  print(h);
                  _result = w / (h * h);

                  print(_result);
                  if (_result < 18) {
                    _message = "You are underweight";
                  } else if (_result > 18 && _result < 25) {
                    _message = "You are healthy";
                  } else if (_result > 25) {
                    _message = "You are overweight";
                  }
                  else {
                    _message = "";
                    _result = 0;
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: const Text("Calculate",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white,),
              ),
            ),
          ),

          const SizedBox(height: 40,),
          Container(
            width: 200,
            height: 70,
            child: Text(
              _result.toStringAsFixed(2),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w600, color: teal),
            ),
          ),

          const SizedBox(height: 30,),
          Visibility(
            visible: _message.isNotEmpty,
            child: Container(
              width: 400,
              height: 70,
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: primary2),
              ),
            ),
          ),

          const SizedBox(height: 50,),
          const Bar(barWidth: 64, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 128, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 25, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 90, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 40, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),

          const Bar(barWidth: 90, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 40, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 25, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 128, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 64, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 30,),
        ],
        ),
      ),
    );
  }
}