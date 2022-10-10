import 'package:flutter/material.dart';

import 'package:zen_file_transfer/services/sender.dart';

import '../methods/methods.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Sender photonSePhotonSender = Sender();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isloading) ...{
          Card(
            color: const Color.fromARGB(56, 218, 153, 61),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: InkWell(
              onTap: () async {
                setState(() {
                  isloading = true;
                });
                await handleSharing(context);
                setState(() {
                  isloading = false;
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/send.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Card(
            color: const Color.fromARGB(56, 218, 153, 61),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/receivepage');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/rec.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Receive',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        } else ...{
          const Center(
            child: Text(
              'Please wait !',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          )
        },
      ],
    );
  }
}
