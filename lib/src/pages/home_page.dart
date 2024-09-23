import 'package:flutter/material.dart';
import 'package:teste1/src/componets_firebase/stream_data.dart';
import 'package:teste1/src/database/firebase_data_base.dart';

class HomePage extends StatelessWidget {
  final FirebaseDataBase _db = FirebaseDataBase();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G L I C O S E'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user_page');
            },
            icon: Icon(
              Icons.person_2,
              size: 32,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: _db.getGlicoseData(),
        builder: (context, snapshot) {
          var glicoseData = snapshot.data?.data();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (glicoseData == null ||
              (glicoseData['manha'] == null &&
                  glicoseData['tarde'] == null &&
                  glicoseData['noite'] == null)) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  _db.crateDailyGlicose();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Adicionar o dia de hoje',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return StreamData(
            data: '${glicoseData['create']}',
            manhaValue: '${glicoseData['manha']}mg/dL',
            noiteValue: '${glicoseData['noite']}mg/dL',
            tardeValue: '${glicoseData['tarde']}mg/dL',
            mudarManha: () {
              _showEditDialog(
                context,
                'manha',
                int.parse(
                  glicoseData['manha'].toString(),
                ),
              );
            },
            mudarTarde: () {
              _showEditDialog(
                context,
                'tarde',
                int.parse(
                  glicoseData['tarde'].toString(),
                ),
              );
            },
            mudarNoite: () {
              _showEditDialog(
                context,
                'noite',
                int.parse(
                  glicoseData['noite'].toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, String field, int currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar $field'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Novo valor'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Atualiza o valor no Firestore
                _db.updateGlicoseField(field, int.parse(controller.text));
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
