import 'package:chat/proceso/autentificacio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (Autentificacion().usuarios?.email).toString() ==
                        respuesta.data!.docs[index].get("email")
                    ? Colors.green[50]
                    : Colors.red[50],
                child: ListTile(
                  title: Text(
                    respuesta.data!.docs[index].get("mensaje"),
                    textAlign: (Autentificacion().usuarios?.email).toString() ==
                            respuesta.data!.docs[index].get("email")
                        ? TextAlign.left
                        : TextAlign.right,
                  ),
                  subtitle: Text(respuesta.data!.docs[index].get("email"),
                      textAlign:
                          (Autentificacion().usuarios?.email).toString() ==
                                  respuesta.data!.docs[index].get("email")
                              ? TextAlign.left
                              : TextAlign.right),
                ),
              );
            },
          );
        });
  }
}
