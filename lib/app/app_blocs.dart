import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:moviemot/movie/repository/movie_repository.dart';

class AppBlocs extends StatelessWidget {
  const AppBlocs({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepository>(
          create: (context) => const MovieRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              movieRepository: context.read<MovieRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
