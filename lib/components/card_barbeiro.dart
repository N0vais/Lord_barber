import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';

class CardBarbeiro extends StatelessWidget{
  const CardBarbeiro({Key? key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset(
                  'assets/profile1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Barbeiro Rian sui",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Especialista em barba",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text('4.5'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('Reviews'),
                        Spacer(
                          flex: 1,
                        ),
                        Text('(20)'),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
