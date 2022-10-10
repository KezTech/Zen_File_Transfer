import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:zen_file_transfer/components/snackbar.dart';
import 'package:zen_file_transfer/methods/methods.dart';
import 'package:zen_file_transfer/models/share_history_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 229, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(56, 218, 153, 61),
        title: const Text('History'),
        flexibleSpace: Container(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              icon: const Icon(Icons.delete_forever_rounded),
              onPressed: () {
                setState(() {
                  clearHistory();
                });
                showSnackBar(context, 'History cleared');
              },
            ),
          ),
        ),
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      body: FutureBuilder(
        future: getHistory(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.connectionState == ConnectionState.done) {
            late List<ShareHistory> data;

            snap.data == null
                ? data = []
                : data = HistoryList.formData(snap.data).historyList;

            return snap.data == null
                ? const Center(
                    child: Text('File sharing history will appear here'),
                  )
                : ListView.separated(
                    separatorBuilder: (context, i) {
                      return const Divider(
                        color: const Color.fromARGB(56, 255, 242, 224),
                      );
                    },
                    itemCount: data.length,
                    itemBuilder: (context, item) {
                      return ListTile(
                        leading:
                            getFileIcon(data[item].fileName.split('.').last),
                        onTap: () async {
                          String path =
                              data[item].filePath.replaceAll(r"\", "/");
                          if (Platform.isAndroid || Platform.isIOS) {
                            try {
                              OpenFile.open(path);
                            } catch (_) {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                  context, 'No corresponding app found');
                            }
                          } else {
                            try {
                              launchUrl(
                                Uri.parse(
                                  path,
                                ),
                              );
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Unable to open the file')));
                            }
                          }
                        },
                        title: Text(
                          data[item].fileName,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(getDateString(data[item].date)),
                      );
                    });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
