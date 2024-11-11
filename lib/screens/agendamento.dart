import 'package:barber_lord_definitivo/utils/config.dart';
import 'package:flutter/material.dart';

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage({super.key});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

enum FilterStatus { proximo, complete, cancelar }

class _AgendamentoPageState extends State<AgendamentoPage> {
  FilterStatus status = FilterStatus.proximo;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "barbeiro_name": "Rian sui",
      "barbeiro_profile": "assets/barbeiro1.png",
      "categoria": "barba",
      "status": "FilterStatus.proximo",
    },
    {
      "barbeiro_name": "pedro coe",
      "barbeiro_profile": "assets/barbeiro1.png",
      "categoria": "barba",
      "status": "FilterStatus.complete",
    },
    {
      "barbeiro_name": "juan riba",
      "barbeiro_profile": "assets/barbeiro1.png",
      "categoria": "barba",
      "status": "FilterStatus.complete",
    },
    {
      "barbeiro_name": "matsumoto ben",
      "barbeiro_profile": "assets/barbeiro1.png",
      "categoria": "barba",
      "status": "FilterStatus.cancelar",
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status.toString();
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Agendamento',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (filterStatus == FilterStatus.proximo) {
                                    status = FilterStatus.proximo;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus == FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  } else if (filterStatus == FilterStatus.cancelar) {
                                    status = FilterStatus.cancelar;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Center(
                                child: Text(filterStatus.name),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _alignment,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSchedules.length,
                  itemBuilder: (context, index) {
                    var schedule = filteredSchedules[index];
                    bool isLastElement = filteredSchedules.length - 1 == index;
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      margin: !isLastElement
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    schedule['barbeiro_profile']),
                                   // Ajuste conforme necessário
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule['barbeiro_name'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      schedule['categoria'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const CardAgenda(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(color: Config.primaryColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Config.primaryColor,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Reschedule',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CardAgenda extends StatelessWidget {
  const CardAgenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(0),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'segunda, 08/11/2024',
            style: const TextStyle(color: Config.primaryColor),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
                '2:00 PM',
                style: const TextStyle(color: Config.primaryColor),
              ))
        ],
      ),
    );
  }
}
