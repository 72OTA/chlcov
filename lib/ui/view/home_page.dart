import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chlcov/core/bloc/chile/bloc.dart';
import 'package:chlcov/ui/constant/constant.dart';
import 'package:chlcov/ui/constant/injector.dart';
import 'package:chlcov/ui/widgets/app_widgets.dart';
import 'package:chlcov/ui/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: BlocProvider<ChileBloc>(
        create: (context) => sl<ChileBloc>(),
        child: BlocListener<ChileBloc, ChileState>(
          listener: (context, state) {
            if (state is FailureChileState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: SizedBox.expand(
            child: Stack(
              children: <Widget>[
                AppWidget(
                  image: "assets/images/sintoma.png",
                  tagline: 'Chile\nCOVID-19',
                  imageTop: 60,
                ),
                SingleChildScrollView(
                  child: HomeBody(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
