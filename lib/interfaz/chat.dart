import 'package:chat/interfaz/mensajes.dart';
import 'package:chat/proceso/autentificacio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Autentificacion().CerrarSesion();
                },
                icon: Icon(Icons.logout)),
            VerticalDivider(),
            Text((Autentificacion().usuarios?.email).toString())
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: mensaje,
                  decoration: InputDecoration(hintText: "Mensaje..."),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (mensaje.text.isNotEmpty) {
                      fire.collection("Chat").doc().set({
                        "mensaje": mensaje.text,
                        "tiempo": DateTime.now(),
                        "email": (Autentificacion().usuarios?.email).toString()
                      });
                      mensaje.clear();
                    }
                  },
                  icon: Icon(Icons.send))
            ],
          ),
          Container(
            child: Expanded(child: mensajes()),
          )
        ]),
      ),
    );
  }
}
