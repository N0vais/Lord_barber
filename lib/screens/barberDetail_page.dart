import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/custon_appbar.dart';

class BarberDetail extends StatefulWidget {
  const BarberDetail({Key? key}) : super(key: key);
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
          child: Column(
        children: <Widget>[
          ///aui vai o avtar e a introducao do barbeiro
          AboutBarber(),

          ///aqui vai os detalhes do barbeiro
          BarberInfo(),
        ],
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
            'Barbeiro Richarlison lopes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceMedian,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Sou uma pessoa estrovertida e ganhei o meu publico com sinceriada e honestidade,cobrando o preço justo e oferecendo um bom serviço (ESSE SOU EU). ',
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
          Config.spaceBig,
          const Text('Sobre o barbeiro',
          style: TextStyle(
            color: Colors.black ,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          )
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
        InfoCard(
            label: 'Clientes',
            value: '189'),
        SizedBox(width: 15),
        InfoCard(
            label: 'Experiencia',
            value: '4 anos'),
        SizedBox(width: 15),
        InfoCard(
            label: 'Avaliações',
            value: '5.0'),
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
  return   Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey.shade700,
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
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
