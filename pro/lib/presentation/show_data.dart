import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pro/widgets/text_widget.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(text: "Show Data"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) { 
                    return ListTile(
                      leading: CircleAvatar(
                        child: TextWidget(text: "${index+1}"),
                      ),
                      title: TextWidget(
                          text: "${snapshot.data!.docs[index]["description"]}"),
                      subtitle: TextWidget(
                          text: "${snapshot.data!.docs[index]["title"]}"),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,

                );
              } else if (snapshot.hasError) {
                return Center(child: TextWidget(text: "${snapshot.hasError.toString()}"));
              }
               else {
                return Center(
                  child: TextWidget(text: "No Data Found"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
