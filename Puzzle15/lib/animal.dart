import 'package:flutter/material.dart';
import 'package:puzzle/title.dart';
import 'main.dart';

class animal extends StatelessWidget {
  var name = "";
  var Des ="";
  animal(this.name,this.Des);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  double screenHeight(BuildContext context, {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).height - reducedBy) / dividedBy;
  }
  double screenHeightExcludingToolbar(BuildContext context, {double dividedBy = 1}) {
    return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Description',
      home: Scaffold(
        appBar: AppBar(
          title: TitleText(name),
          backgroundColor: Colors.green[700],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeightExcludingToolbar(context,
                  dividedBy: 2),
              width: double.infinity,
              child: Image.asset('images/$name.jpg'),
            ),
            Text("$name",
              style: TextStyle(
                height: 1,
                fontSize: 30 // foreground
              ),),
            Text(Des,
              style: TextStyle(
                  height: 1,
                  fontSize: 20 // foreground
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[700], // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: const Text(
                  'Main Menu',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
