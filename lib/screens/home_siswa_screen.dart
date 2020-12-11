import 'dart:async';
import 'dart:convert';
import 'package:fire_bloc/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fire_bloc/components/components.dart';
import 'package:fire_bloc/screens/screens.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:fire_bloc/utils/utils.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

class HomeSiswaScreen extends StatefulWidget {
  HomeSiswaScreen({Key key, this.data}) : super(key: key);
  final UserModel data;

  @override
  _HomeSiswaScreenState createState() => _HomeSiswaScreenState();
}

class _HomeSiswaScreenState extends State<HomeSiswaScreen> {
  Map<int, bool> check = <int, bool>{};
  int total = 20;
  int masuk = 17;
  int izin = 3;
  int touchedIndex;
  UserModel user;
  double heightM;
  double widthM;
  String hasil;
  Position _position;
  SocketIO socketIO;
  String now;

  @override
  void initState() {
    super.initState();
    GeolocatorPlatform.instance.getPositionStream().listen((event) {
      if (event != null) {
        _position = event;
      }
    });
    this.initSocket();
  }

  Map<String, double> data = {
    'masuk': 17,
    'izin': 3,
  };

  void initSocket() {
    now = new DateTime.now().toString().split(" ")[1];
    socketIO = SocketIOManager().createSocketIO(apiUrl, '/');
    socketIO.init();
    socketIO.connect();
  }

  @override
  Widget build(BuildContext context) {
    user = widget.data;
    heightM = MediaQuery.of(context).size.height;
    widthM = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: <Widget>[_header(), _list()],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () async {
            String text = await scanner.scan();
            if (text.isNotEmpty) {
              var mess = {
                'nisn': user.nisn,
                'kelas': text,
                'lokasi': _position.longitude.toString() +
                    ',' +
                    _position.latitude.toString(),
                'ket': 'Masuk',
              };
              print("berhasil");
              socketIO.sendMessage('absen', jsonEncode(mess));
              socketIO.subscribe("berubah", (var res) {
                print("data: " + res.berubah);
              });
            }
            setState(() {
              hasil = text;
            });
          },
          child: Icon(Icons.qr_code_scanner),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.heart),
      //       label: "Love",
      //       activeIcon: FaIcon(FontAwesomeIcons.solidHeart),
      //     )
      //   ],
      //   selectedItemColor: primaryC,
      //   unselectedItemColor: blackC,
      // ),
    );
  }

  Container _header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: boxHeader,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _profile(),
          Flexible(
            flex: 2,
            child: Container(
              height: heightM / 8,
              width: heightM / 8,
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
          ),
        ],
      ),
    );
  }

  Widget _profile() {
    return Flexible(
      flex: 4,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(
              user.nama ?? "Agus Prayogi",
              style: titleStyle(18),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              (user.kelas + " " + user.jurusan) ?? "XII RPL 2",
              style: TextStyle(color: whiteC),
              textAlign: TextAlign.left,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: BoxKotak(
                        color: masukC,
                        title: "Masuk",
                        state: "$masuk",
                        widht: 43.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: BoxKotak(
                        color: lightC,
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
              ),
            )
          ],
        ),
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
