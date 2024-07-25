import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/blocs/puzzle_bloc.dart';
import 'package:flutter_application/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fifteen Puzzle Game',
      home: BlocProvider(
        create: (context) => PuzzleBloc(grid: _initialGrid()),
        child: const HomeScreen(),
      ),
    );
  }

  List<List<String>> _initialGrid() {
    List<String> shuffledList = [
      '1',
      '',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15'
    ];
    shuffledList.shuffle();
    List<List<String>> grid = [];
    for (int i = 0; i < 4; i++) {
      List<String> subList = [];
      for (int j = 0; j < 4; j++) {
        subList.add(shuffledList[i * 4 + j]);
      }
      grid.add(subList);
    }
    return grid;
  }
}
