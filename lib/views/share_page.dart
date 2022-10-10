import 'package:flutter/material.dart';
import 'package:zen_file_transfer/components/dialogs.dart';
import 'package:zen_file_transfer/models/sender_model.dart';
import 'package:zen_file_transfer/services/sender.dart';

import '../components/components.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  SenderModel senderModel = Sender.getServerInfo();
  Sender photonSender = Sender();
  late double width;
  late double height;
  bool willPop = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
          backgroundColor:  Colors.white,
          appBar: AppBar(
            backgroundColor:const Color.fromARGB(56, 218, 153, 61),

        title: const Text('Share Info'),
            leading: BackButton(onPressed: () {
              sharePageAlertDialog(context);
            }),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Text(
                    '${photonSender.hasMultipleFiles ? 'Your files are ready to be shared' : 'File is ready to be shared'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width > 720 ? 18 : 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: const Color.fromARGB(150, 16, 134, 189),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: SizedBox(
                      height: width > 720 ? 200 : 128,
                      width: width > 720 ? width / 2 : width / 1.25,
                      child: Center(
                        child: Wrap(
                          direction: Axis.vertical,
                          children: infoList(senderModel, width, height, true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      onWillPop: () async {
        willPop = await sharePageWillPopDialog(context);
        return willPop;
      },
    );
  }
}
