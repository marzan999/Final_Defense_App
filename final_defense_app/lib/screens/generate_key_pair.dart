import 'package:final_defense_app/screens/send_for_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenerateKeyPair extends StatefulWidget {
  const GenerateKeyPair({super.key});

  @override
  State<GenerateKeyPair> createState() => _GenerateKeyPairState();
}

class _GenerateKeyPairState extends State<GenerateKeyPair> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff0078D4)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SendForSign()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      child: Center(
                        child: Text(
                          "Generate Key Pair",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "SFPro"),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
