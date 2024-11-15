//card do agendamento,da pagina principal
import 'package:flutter/material.dart';

class CardAgenda extends StatelessWidget {
  const CardAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    //card incluido da agenda do barbeiro
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.black,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'segunda, 08/11/2024',
            style: const TextStyle(color: Colors.black38),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.black,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2:00 PM',
            style: const TextStyle(color: Colors.black38),
          ))
        ],
      ),
    );
  }
}
