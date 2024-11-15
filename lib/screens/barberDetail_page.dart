import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/butomLogin.dart';
import '../components/custon_appbar.dart';

class BarberDetail extends StatefulWidget {
  const BarberDetail({super.key});

  @override
  State<BarberDetail> createState() => _BarberDetailState();
}

class _BarberDetailState extends State<BarberDetail> {
  //botao dos favoritos
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustonAppbar(
        appTitle: 'detalhes do barbeiro',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            //botao do favorito
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: FaIcon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AboutBarber(),

            ///aui vai o avtar e a introducao do barbeiro
            DetalhesBarbeiro(),

            ///aqui vai os detalhes do barbeiro
            Config.spaceSmall,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Butomlogin(
                  width: double.infinity,
                  title: 'Agendamento',
                  onPressed: () {
                    //naavegaçao do botao
                    Navigator.of(context).pushNamed('bookin');
                  },
                  disable: false),
            )
          ],
        ),
      )),
    );
  }
}

class AboutBarber extends StatelessWidget {
  const AboutBarber({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/barbeiro1.png'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedian,
          Text(
            'Barbeiro, Richarlison lopes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Sou uma pessoa estrovertida e ganhei o publico com sinceriada, oferecendo um bom serviço (ESSE SOU EU). ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'beard designer em "Barbearia Lord"',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetalhesBarbeiro extends StatelessWidget {
  const DetalhesBarbeiro({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          const BarberInfo(),
          Config.spaceMedian,
          const Text(
            'Sobre o barbeiro',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Config.spaceSmall,
          Text(
            "Com habilidades e um olhar atento aos detalhes, Richarlison lopes esculpe barbas impecáveis. Sua jornada na arte da barbearia começou na escola , onde ele aperfeiçoou técnicas modernas. tornando-o um verdadeiro mestre da barba.",
            style: TextStyle(
              height: 1.2,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class BarberInfo extends StatelessWidget {
  const BarberInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        SizedBox(width: 15),
        InfoCard(label: 'Clientes', value: '189'),
        SizedBox(width: 15),
        InfoCard(label: 'Experiencia', value: '4 anos'),
        SizedBox(width: 15),
        InfoCard(label: 'Avaliações', value: '5.0'),
        SizedBox(width: 15),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.blueGrey.shade700,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ));
  }
}
