import 'package:barber_lord_definitivo/components/card_agendamento.dart';
import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/card_barbeiro.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> estilos = [
    {
      "icon": FontAwesomeIcons.usersViewfinder,
      "category": "Barba",
    },
    {
      "icon": FontAwesomeIcons.userCheck,
      "category": "corte social",
    },
    {
      "icon": FontAwesomeIcons.crosshairs,
      "category": "corte modelo",
    },
    {
      "icon": FontAwesomeIcons.person,
      "category": "cortes longos",
    },
    {
      "icon": FontAwesomeIcons.personBooth,
      "category": "depilador(a)",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Daniel', //colocar depois o user name
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/barbeiro1.png'),
                      ),
                    )
                  ],
                ),
                Config.spaceMedian,
                //listando as categorias
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                //cards scroller
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(estilos.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Colors.blueGrey.shade700,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                estilos[index]['icon'],
                                color: Colors.grey.shade200,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                estilos[index]['category'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,

                const Text(
                  'Agendamento ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                CardAgendamento(),
                Config.spaceSmall,

                const Text(
                  'Barbeiros Lord ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,

                Column(
                  children: List.generate(10, (index) {
                    return const CardBarbeiro(route: 'detalhe_barber',);
                  }),
                ),
              ]),
        )),
      ),
    );
  }
}
