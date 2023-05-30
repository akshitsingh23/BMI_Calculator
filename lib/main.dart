import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '                  Body Mass Index'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wcontroller = TextEditingController();
  var ftcontrol= TextEditingController();
  var inchcntrl = TextEditingController();
  var result="";
  var col=Colors.lightBlueAccent.shade200;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: col,
        child: Center(
          heightFactor: 100,
          widthFactor: 100,
          child: Container(

            height: 1000,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('BMI', style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.w600),),
               const SizedBox(height: 3,),
                TextField(
                  controller: wcontroller,
                  decoration:const InputDecoration(
                    label: Text("Enter your weight in kgs",),
                    prefixIcon: Icon(Icons.scale),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftcontrol,
                  decoration:const InputDecoration(
                      label: Text("Enter your height in feet"),
                      prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inchcntrl,
                  decoration:const InputDecoration(
                      label: Text("Enter your height in inches",),
                      prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0,),
                ElevatedButton(
                  onPressed: (){
                  var wt = wcontroller.text.toString();
                  var ft = ftcontrol.text.toString();
                  var it = inchcntrl.text.toString();

                  if(wt!="" && ft!="" && it!="")
                    {
                     //BMI calculation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iit = int.parse(it);
                      var ti = (ift*12)+iit;
                      var tcm = ti*2.54;
                      var tm = tcm/100;
                      var bmi = iwt/(tm*tm);
                      var msg = "";
                      if(bmi<18.5)
                        {
                          msg= "Please Eat Something";
                          col = Colors.blue.shade100;
                        }
                      else if(bmi>=18.5&&bmi<=24.9)
                        {
                          msg = "Very Well You are Fit 💪";
                          col = Colors.green.shade400;
                        }
                      else if(bmi>=25&&bmi<=29.9)
                        {
                          msg = "A little work need to be done";
                          col = Colors.orangeAccent;
                        }
                      else if(bmi>=30&&bmi<=34.9)
                        {
                          msg = "You are obese";
                          col = Colors.red.shade200;
                        }
                      else
                        {
                          msg = "Extremely Obese";
                          col = Colors.redAccent.shade700;
                        }
                      setState(() {
                        result = "$msg \n BMI is : ${bmi.toStringAsFixed(3)}";
                      });
                    }
                  else
                    {
                      setState(() {
                        result = "Please fill all the fields!!";
                      });
                    }

                },
                child: const Text('Calculate BMI'),),
                const SizedBox(height: 16.0,),
                Text(result,style: TextStyle(
                  fontWeight: FontWeight.w800,fontSize: 20,
                ),)
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
