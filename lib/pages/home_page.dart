import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/components/my_boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List smartDevices = [
    ["Smart Bulb", "lib/icons/lightbulb.png", true],
    ["Smart Fan", "lib/icons/fan.png", false],
    ["Smart AC", "lib/icons/air conditioner.png", false],
    ["Smart TV", "lib/icons/smart tv.png", true],
  ];
  void changeOnOff(value, index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 35,
                    color: Colors.grey[900],
                  ),
                  Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey[900],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome home",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      ),
                      Text(
                        "Sharib Khan",
                        style: GoogleFonts.bebasNeue(fontSize: 40),
                      )
                    ],
                  ),
                  Image.asset(
                    'lib/icons/house2.png',
                    height: 75,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: smartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                itemBuilder: (context, index) {
                  return MyBoxes(
                    name: smartDevices[index][0],
                    path: smartDevices[index][1],
                    onOff: smartDevices[index][2],
                    onChanged: (value) => changeOnOff(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
