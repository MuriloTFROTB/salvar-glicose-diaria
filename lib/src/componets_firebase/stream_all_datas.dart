import 'package:flutter/material.dart';

class StreamAllDatas extends StatelessWidget {
  const StreamAllDatas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(
                    '00/00/0000',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                _buildGlicosePeriod(
                  'Manha',
                  'assets/image/night.png',
                  '',
                  () {},
                ),
                SizedBox(
                  height: 8,
                ),
                _buildGlicosePeriod(
                  'Tarde',
                  'assets/image/night.png',
                  '',
                  () {},
                ),
                SizedBox(
                  height: 8,
                ),
                _buildGlicosePeriod(
                  'Noite',
                  'assets/image/night.png',
                  '',
                  () {},
                ),
              ],
            ),
          ),
        ),
      );
  }
}
Widget _buildGlicosePeriod(
  String label,
  String imagePath,
  String value,
  void Function()? edit,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(
        32,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 90,
            width: 90,
            child: Image.asset(
              imagePath,
            ),
          ),
          Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: edit,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    ),
  );
}
