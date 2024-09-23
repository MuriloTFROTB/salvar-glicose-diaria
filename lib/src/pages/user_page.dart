import 'package:flutter/material.dart';
import 'package:teste1/src/database/firebase_data_base.dart';

class UserPage extends StatelessWidget {
  FirebaseDataBase _db = FirebaseDataBase();
  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G L I C O S E'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _db.getAllGLicose(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          // Lista de documentos da coleção 'Glicose'
          var glicoseDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: glicoseDocs.length,
            itemBuilder: (context, index) {
              var glicoseData = glicoseDocs[index].data();

              return ListTile(
                title: Text('Data: ${glicoseData['create']}'),
                subtitle: Text(
                    'Manhã: ${glicoseData['manha']}, Tarde: ${glicoseData['tarde']}, Noite: ${glicoseData['noite']}'),
              );
            },
          );
        },
      ),
    );
  }
}
