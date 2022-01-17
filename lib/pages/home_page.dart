import 'package:flutter/material.dart';
import 'package:safe_vault_version_2/pages/pdf_page.dart';
import 'package:safe_vault_version_2/pages/sms_page.dart';
import 'package:safe_vault_version_2/pages/video_page.dart';
import 'package:safe_vault_version_2/pages/word_page.dart';

import 'image_page.dart';
import 'note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Safe Vault Version 2.0.0 ",
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Home Page",
              ),
              Tab(
                text: "Recent Page",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(choices.length, (index) {
                return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => selectItemRoute(index),
                        ),
                      );
                    },
                    child: Center(
                      child: SelectCard(
                        choice: choices[index],
                        key: Key(toString()),
                      ),
                    ),
                  );
                })),
            const SizedBox()
          ],
        ),
      ),
    );
  }

  gridItemOnTap(BuildContext context, int index) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => selectItemRoute(index),
      ),
    );
  }

  Widget selectItemRoute(int i) {
    switch (i) {
      case 0:
        return   PdfPage();
      case 1:
        return const WordPage();
      case 2:
        return const NotePage();
      case 3:
        return const ImagePage();
      case 4:
        return const SmsPage();
      case 5:
        return const VideoPage();
      default:
        return selectItemRoute(i);
    }
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(
    title: 'PDF',
    icon: Icons.book_online,
  ),
  Choice(title: 'WORD', icon: Icons.text_fields),
  Choice(title: 'NOTE', icon: Icons.note_add),
  Choice(title: 'IMAGE', icon: Icons.image),
  Choice(title: 'SMS', icon: Icons.message),
  Choice(title: 'VIDEO', icon: Icons.video_call_sharp),
];

class SelectCard extends StatelessWidget {
  const SelectCard({required Key key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.caption;
    return Card(
      color: Colors.red,
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child:
                      Icon(choice.icon, size: 50.0, color: textStyle?.color)),
              Text(
                choice.title,
                style: const TextStyle(fontSize: 24),
              ),
            ]),
      ),
    );
  }
}

/*
GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context , int index){
            return GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange , width: 10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(10.0, 5.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.blue[10*((index+1) % 8)],
                  gradient: const LinearGradient(
                      colors:[Colors.yellow , Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),
                  image: const DecorationImage(
                    image: AssetImage("assets/flutter.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
                margin: const EdgeInsets.all(20),
                child: const Padding(
                    padding: EdgeInsets.all(20),
                  child: Text("PDF",
                      textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {

              },
              onDoubleTap: () => debugPrint("Merhaba flutter $index çift tıklanıldı"),
              onLongPress: () => debugPrint("Merhaba flutter $index uzun basıldı"),
              onHorizontalDragStart: (e) => debugPrint("Merhaba flutter $index uzun basıldı $e"),
            );
          }
      ),
 */
