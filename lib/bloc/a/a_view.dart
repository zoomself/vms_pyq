import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'a_bloc.dart';
import 'a_event.dart';
import 'a_state.dart';

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ABloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<ABloc>(context);

    return Container();
  }
}

