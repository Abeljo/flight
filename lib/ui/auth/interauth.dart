// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flight/bloc/auth_bloc.dart';
import 'package:flight/repo/auth_repo.dart';
import 'package:flight/ui/auth/signIn.dart';

class interauth extends StatefulWidget {
  String fromis;
  String tois;
  String rd;
  String dd;
  String finalprice;
  String seatnum;
  String planenum;
  String classing;
  interauth({
    Key? key,
    required this.fromis,
    required this.tois,
    required this.rd,
    required this.dd,
    required this.finalprice,
    required this.seatnum,
    required this.planenum,
    required this.classing,
  }) : super(key: key);

  @override
  State<interauth> createState() => _interauthState();
}

class _interauthState extends State<interauth> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
            home: signIn(
                planenum: widget.planenum.toString(),
                dd: widget.dd.toString(),
                finalprice: widget.finalprice.toString(),
                fromis: widget.fromis.toString(),
                classing: widget.classing.toString(),
                rd: widget.rd.toString(),
                tois: widget.tois.toString(),
                seatnum: widget.seatnum.toString())),
      ),
    );
  }
}
