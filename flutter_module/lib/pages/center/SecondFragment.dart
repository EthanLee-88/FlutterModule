import 'package:flutter/material.dart';

import '../../bean/listData.dart';

class SecondFragment extends StatelessWidget {
  const SecondFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return getMaterialApp();
  }

  MaterialApp getMaterialApp() {
    var materialApp = MaterialApp(home: getListView());
    return materialApp;
  }

  ListView getListView() {
    var listView = ListView(children: getListChildren());
    return listView;
  }

  List<Widget> getListChildren() {
    var childrenList = listData.map((e) => Container(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(6, 1, 6, 1),
        child: ListTile(
            leading: Image.network(e['imageUrl'], fit: BoxFit.fill),
            title: Text(e['title'],
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            subtitle: Text(e['author']))));
    return childrenList.toList();
  }

  IndexedWidgetBuilder getIndexedWidgetBuilder() {
    var itemBuilder = (context, index) {
      return ListTile(
        leading: Icon(Icons.ac_unit_outlined),
        title: Text("碧云天"),
      );
    };
    return itemBuilder;
  }
}
