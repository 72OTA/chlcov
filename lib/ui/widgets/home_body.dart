import 'package:chlcov/core/bloc/provinsi/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chlcov/core/bloc/mundo/bloc.dart';
// import 'package:chlcov/core/bloc/mundo/mundo_event.dart';
import 'package:chlcov/core/bloc/chile/bloc.dart';
import 'package:chlcov/core/model/chile/chile_model.dart';
import 'package:chlcov/ui/constant/constant.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double initialPercentage = 0.65;
  TextEditingController regionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    regionController.text = 'Chile';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ChileBloc>(context).add(LoadDataChileEvent());
      BlocProvider.of<MundoBloc>(context).add(LoadMundoEvent());
      BlocProvider.of<ProvinsiBloc>(context).add(LoadedProvinsiEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 245),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), color: Color(0xFFFEFEFE)),
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 100),
        child: Column(
          children: <Widget>[
            SizedBox(height: spacing(2)),
            UpdateKasus(),
            SizedBox(height: spacing(2)),
            CardKasusIndonesia(),
            SizedBox(height: spacing(2)),
            _buildRegionInput(),
            SizedBox(height: spacing(2)),
            PetaPersebaran(),
            SizedBox(height: spacing(2)),
            // BeritaTerbaru(),
            // SizedBox(height: spacing(2)),
            // ListBerita(),
            // SizedBox(height: spacing(2)),
            // BeritaMundo(),
            // SizedBox(height: spacing(3)),
            // CardKasusMundo(),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionInput() {
    return Container(
      height: 50.0,
      child: TextField(
        controller: regionController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          hintText: 'Santiago',
          contentPadding: const EdgeInsets.all(5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Color(0xffE1E1E1), width: 0.8),
          ),
        ),
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class CardBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 238,
        child: Column(
          children: <Widget>[
            Container(
              height: 134,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(spacing(2))),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.camera,
                size: 80,
              ),
            ),
            SizedBox(
              height: spacing(1),
            ),
            Container(
              width: 136,
              child: Text(
                'Video wanita sakit paru-paru BUKAN COVID-19',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaMundo extends StatelessWidget {
  const BeritaMundo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Data COVID-19 Mundo",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 16,
              ),
            ),
            SizedBox(height: spacing(0.5)),
            Text(
              "Data akumulasi dari awal muncul",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 11,
              ),
            ),
          ],
        ),
        OutlineButton(
          onPressed: () {},
          child: Text("Detalles"),
          color: deepIndigo,
          highlightedBorderColor: deepIndigo,
        )
      ],
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return CardBerita();
        },
      ),
    );
  }
}

class BeritaTerbaru extends StatelessWidget {
  const BeritaTerbaru({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHeader(title: 'Berita Terbaru', desc: 'Diperbaharui 1 jam yang lalu', onPressedAction: () => Navigator.pushNamed(context, '/news'));
  }
}

class PetaPersebaran extends StatelessWidget {
  const PetaPersebaran({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'America',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 8,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset('assets/images/BitmapChile.png'),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '+893',
                          style: theme.textTheme.headline4.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'Casos Pais',
                          style: theme.textTheme.bodyText2.copyWith(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '578',
                          style: theme.textTheme.headline4.copyWith(
                            color: Colors.purple[300],
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'PDP',
                          style: theme.textTheme.bodyText2.copyWith(
                            color: Colors.purple[300],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '3703',
                          style: theme.textTheme.headline4.copyWith(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'ODP',
                          style: theme.textTheme.bodyText2.copyWith(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardKasusIndonesia extends StatelessWidget {
  final IconData icon;

  const CardKasusIndonesia({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ChileBloc, ChileState>(
          builder: (context, state) {
            if (state is LoadingChileState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedChileState) {
              return buildRowUpdateKasus(state.chileModel);
            } else if (state is FailureChileState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Column buildRowUpdateKasus(ChileModel data) {
    return Column(
      children: <Widget>[
          Row(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.calendar_today, color: Colors.grey),
                buildNumberCount(value: data.day, color: Colors.grey),
                Text('Fecha de hoy'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.add, color: Colors.cyan[900]),
                buildNumberCount(value: data.confirmed, color: Colors.cyan[900]),
                Text('Positivos'),
              ],
            ),
            Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.close, color: Colors.red),
                buildNumberCount(value: data.deaths, color: Colors.red),
                Text('Muertos'),
              ],
            ),
          ],
        ),
        Row(  
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.group_add, color: Colors.cyan[900]),
                buildNumberCount(value: data.confirmedPer100K.toString(), color: Colors.cyan[900]),
                Text('Positivos cada 100k'),
              ],
            ),
            Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.mood_bad, color: Colors.red),
                buildNumberCount(value: data.deathsPer100K.toString(), color: Colors.red),
                Text('Muertos cada 100k'),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class UpdateKasus extends StatelessWidget {
  const UpdateKasus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHeader(
      title: "COVID-19",
      desc: "Actualización de casos",
      onPressedAction: () {},
    );
  }
}

Container buildIconHeader({icon, color}) {
  return Container(
    width: 26,
    height: 26,
    decoration: BoxDecoration(
      color: Color.alphaBlend(Colors.white70, color),
      borderRadius: BorderRadius.circular(26.0),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 24.0,
        color: color,
      ),
    ),
  );
}

Text buildNumberCount({String value, Color color}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget buildHeader({String title, String desc = '', Function onPressedAction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 16,
            ),
          ),
          SizedBox(height: spacing(0.5)),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Poppins",
              fontSize: 12,
            ),
          ),
        ],
      ),
      onPressedAction == null
          ? Container()
          : OutlineButton(
              onPressed: onPressedAction,
              child: Text("Detalles"),
              color: deepIndigo,
              textColor: Colors.purple,
              highlightedBorderColor: deepIndigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
    ],
  );
}

class CardKasusMundo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: BlocBuilder<MundoBloc, MundoState>(
          builder: (context, state) {
            if (state is LoadingMundoState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedMundoState) {
              final listMundoModel = state.listMundoModel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listMundoModel.asMap().keys.map((index) {
                  final item = listMundoModel[index];
                  Color color;
                  if (index == 0) {
                    color = Colors.orange;
                  } else if (index == 1) {
                    color = Colors.green;
                  } else {
                    color = Colors.red;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          top: 16,
                          right: 16,
                        ),
                        child: Text(
                          item.day,
                          style: TextStyle(color: color),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          item.confirmed,
                          style: TextStyle(
                            color: color,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      index == listMundoModel.length - 1 ? Container() : Divider(thickness: 1),
                    ],
                  );
                }).toList(),
              );
            } else if (state is FailureMundoState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildTileKasusMundo({title, icon, number, Color color}) {
    return Row(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(icon, color: color, size: 30),
            ),
            Column(
              children: <Widget>[
                Text(title, style: TextStyle(color: color, fontSize: 12)),
                Text(number, style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
