// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/Model/world_states.dart';
import 'package:myapp/Reuseable/Reuseable%20widget.dart';
import 'package:myapp/Services/Utilities/state_servies.dart';
import 'package:myapp/View/countries.dart';
import 'package:pie_chart/pie_chart.dart';

class Worldstate extends StatefulWidget {
  const Worldstate({Key? key}) : super(key: key);

  @override
  _WorldstateState createState() => _WorldstateState();
}

class _WorldstateState extends State<Worldstate> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServies statesServies = StatesServies();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                FutureBuilder(
                    future: statesServies.worldstateRecords(),
                    builder:
                        (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            controller: _controller,
                            size: 50.0,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            PieChart(
                              dataMap: {
                                'Total': double.parse(
                                    snapshot.data!.cases!.toString()),
                                'Recovered': double.parse(
                                    snapshot.data!.recovered!.toString()),
                                'Deaths': double.parse(
                                    snapshot.data!.deaths!.toString()),
                              },
                              chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              legendOptions: LegendOptions(
                                  legendPosition: LegendPosition.left),
                              chartRadius:
                                  MediaQuery.of(context).size.height / 3.2,
                              animationDuration: Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              colorList: colorList,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * .06),
                              child: Card(
                                child: Column(
                                  children: [
                                    ReuseableWidget(
                                        title: 'Total',
                                        value:
                                            snapshot.data!.cases!.toString()),
                                    ReuseableWidget(
                                        title: 'Deaths',
                                        value:
                                            snapshot.data!.deaths!.toString()),
                                    ReuseableWidget(
                                        title: 'Recovered',
                                        value: snapshot.data!.recovered!
                                            .toString()),
                                    ReuseableWidget(
                                        title: 'Active',
                                        value:
                                            snapshot.data!.active!.toString()),
                                    ReuseableWidget(
                                        title: 'Crtical',
                                        value: snapshot.data!.critical!
                                            .toString()),
                                    ReuseableWidget(
                                        title: 'Today-Deaths',
                                        value: snapshot.data!.todayDeaths!
                                            .toString()),
                                    ReuseableWidget(
                                        title: 'Today-Recovered',
                                        value: snapshot.data!.todayRecovered!
                                            .toString()),

                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Countries()));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xff1aa260),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text('Track Countries')),
                              ),
                            )
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
