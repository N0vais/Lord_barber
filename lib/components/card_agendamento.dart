import 'package:barber_lord_definitivo/components/card_agenda.dart';
import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';

class CardAgendamento extends StatefulWidget {
  const CardAgendamento({
    super.key,
  });

  @override
  State<CardAgendamento> createState() => _CardAgendamento();
}

class _CardAgendamento extends State<CardAgendamento> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/barbeiro1.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Barbeiro, daniel',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'barba',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              //adicionando o card agenda
              const CardAgenda(),
              Config.spaceSmall,

              //açao do botao
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancelar',
                      style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){},
                      ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Complete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){},
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
