import 'package:flutter/material.dart';

class StreamData extends StatelessWidget {
  final String manhaValue;
  final String tardeValue;
  final String noiteValue;
  final String data;
  final void Function()? mudarManha;
  final void Function()? mudarTarde;
  final void Function()? mudarNoite;

  const StreamData(
      {super.key,
      required this.manhaValue,
      required this.tardeValue,
      required this.data,
      required this.noiteValue,
      this.mudarManha,
      this.mudarTarde,
      this.mudarNoite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Adiciona o SingleChildScrollView
        child: Column(
          children: [
            Text(
              data,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _buildGlicoseCard(
              'MANHA',
              manhaValue,
              'assets/image/morning.png',
              mudarManha,
            ),
            SizedBox(
              height: 16,
            ),
            _buildGlicoseCard(
              'TARDE',
              tardeValue,
              'assets/image/afternoon.png',
              mudarTarde,
            ),
            SizedBox(
              height: 16,
            ),
            _buildGlicoseCard(
              'NOITE',
              noiteValue,
              'assets/image/night.png',
              mudarNoite,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlicoseCard(
      String label, String value, String imagePath, void Function()? onEdit) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
        color: const Color(0xFFE8E0E0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Image.asset(imagePath),
            ),
            Column(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onEdit,
              icon: Icon(
                Icons.edit,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
