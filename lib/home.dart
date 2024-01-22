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
  final TextEditingController heightController = TextEditingController();

  double _result = 0.0;
  String _message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightController.text = '';
    heightController.text = '';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 350,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: weightController,
                  style: const TextStyle(
                      fontSize: 40,
                      color: accent
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: "Weight (kg)",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary)
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      )
                  ),
                ),
              ),
              const SizedBox(height: 60,),
              SizedBox(
                width: 350,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  style: const TextStyle(
                      fontSize: 40,
                      color: accent
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: "Height (cm)",
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
          SizedBox(
            width: 250,
            height: 65,
            child: TextButton(
              onPressed: () {
                setState(() {
                  print("+++++++++++ Weight ${weightController.text}");
                  print("=========== Height ${heightController.text}");

                  var h = heightController.text.isNotEmpty? double.parse(heightController.text) : 0.00;
                  var w = weightController.text.isNotEmpty? double.parse(weightController.text) : 0.00;
                  if ( h > 100 ){ h = h / 100; }
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
          SizedBox(
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
            child: SizedBox(
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
          const SizedBox(height: 20,),
          const Bar(barWidth: 128, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 25, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),
          const Bar(barWidth: 90, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 20,),
          const Bar(barWidth: 40, barAlignment: MainAxisAlignment.end),
          const SizedBox(height: 10,),

          const Bar(barWidth: 90, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 30,),
          const Bar(barWidth: 40, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 128, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 25, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 10,),
          const Bar(barWidth: 64, barAlignment: MainAxisAlignment.start),
          const SizedBox(height: 30,),
        ],
        ),
      ),
    );
  }
}