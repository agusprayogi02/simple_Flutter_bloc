import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fire_bloc/components/components.dart';
import 'package:fire_bloc/screens/screens.dart';
import 'package:fire_bloc/utils/utils.dart';

class HomeSiswaScreen extends StatefulWidget {
  HomeSiswaScreen({Key key}) : super(key: key);

  @override
  _HomeSiswaScreenState createState() => _HomeSiswaScreenState();
}

class _HomeSiswaScreenState extends State<HomeSiswaScreen> {
  Map<int, bool> check = <int, bool>{};
  int total = 20;
  int masuk = 17;
  int izin = 3;
  int touchedIndex;

  Map<String, double> data = {
    'masuk': 17,
    'izin': 3,
  };

  Widget __header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            "Agus Prayogi",
            style: titleStyle(18),
          ),
          Text(
            "XII RPL 2",
            style: TextStyle(color: whiteC),
            textAlign: TextAlign.left,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BoxKotak(
                  color: masukC,
                  title: "Masuk",
                  state: "$masuk",
                  widht: 43.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: BoxKotak(
                    color: primaryC,
                    title: "Total",
                    state: "$total",
                    widht: 43.0,
                  ),
                ),
                BoxKotak(
                  color: izinC,
                  title: "Izin",
                  state: "$izin",
                  widht: 43.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _kotakJam() {
    return Container(
      margin: EdgeInsets.all(4),
      height: 44,
      width: 70,
      decoration: BoxDecoration(
          color: primaryC, borderRadius: BorderRadius.circular(2)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3),
            child: Text(
              "06:21",
              style: TextStyle(
                color: whiteC,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: whiteC,
            height: 2,
          ),
          Text(
            "Masuk",
            style: TextStyle(
              color: whiteC,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: lightC,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            for (int i = 1; i <= 20; i++)
              Card(
                color: Color(0xffB4FF7F),
                child: Row(
                  children: [
                    _kotakJam(),
                    Container(
                      height: 44,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "30 September",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Status : Tepat Waktu",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: boxHeader,
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                __header(),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 8,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (touch) {
                        setState(() {
                          if (touch.touchInput is FlLongPressEnd ||
                              touch.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = touch.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sections: _section(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _list()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "Love",
            activeIcon: FaIcon(FontAwesomeIcons.solidHeart),
          )
        ],
        selectedItemColor: primaryC,
        unselectedItemColor: blackC,
      ),
    );
  }

  List<PieChartSectionData> _section() {
    return List.generate(2, (i) {
      final isTouch = i == touchedIndex;
      final double radius = isTouch ? 60 : 50;
      final double fontSize = isTouch ? 16 : 14;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffB4FF7F),
            value: masuk.toDouble(),
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: blackC,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xffF2C94C),
            value: izin.toDouble(),
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: blackC,
            ),
          );
        default:
          return null;
      }
    });
  }
}
