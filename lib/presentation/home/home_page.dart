import 'package:eriell/presentation/home/widgets/landscape_mode_data.dart';
import 'package:eriell/presentation/home/widgets/portrait_mode_data.dart';
import 'package:eriell/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 2.8;
    return Scaffold(
      appBar: const EriellAppBar(
        title: "Overall social media data",
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final bloc = context.read<HomeBloc>();
            if (Orientation.portrait == orientation) {
              return PortraitModeData(radius: radius, bloc: bloc);
            } else {
              return LandscapeModeData(bloc: bloc);
            }
          },
        ),
      ),
    );
  }
}
