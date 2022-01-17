import 'package:flutter/material.dart';
import 'package:safe_vault_version_2/database/database_helper.dart';
import 'package:safe_vault_version_2/database/veri_model.dart';

DatabaseHelper dbhelper = DatabaseHelper();

class PdfPage extends StatefulWidget {
  DatabaseHelper dbHelper = DatabaseHelper();

  PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  final myController0 = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF PAGE"),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.format_list_numbered),
                          labelText: "ID ",
                        ),
                        controller: myController0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.drive_file_rename_outline),
                            labelText: "DOSYA ADI"),
                        controller: myController1,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.create_new_folder),
                            labelText: "OLUŞTURMA TARİHİ"),
                        controller: myController2,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.photo_size_select_large_rounded),
                            labelText: "BOYUT"),
                        controller: myController3,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await widget.dbHelper.create(
                                table_name: "PDFTABLE",
                                model: DataModel(
                                    id: int.parse(myController0.text),
                                    name: myController1.toString(),
                                    creat: int.parse(myController2.text),
                                    size: int.parse(myController3.text)).toJson());
                          },
                          child: const Text("EKLE")),
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
