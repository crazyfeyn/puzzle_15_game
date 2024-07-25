import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/puzzle_bloc.dart';
import 'package:flutter_application/blocs/puzzle_event.dart';
import 'package:flutter_application/blocs/puzzle_state.dart';
import 'package:flutter_application/ui/widgets/grid_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List<List<String>> numbers2D = [];

  @override
  void initState() {
    super.initState();
    shuffledList.shuffle();
    _create2DArray();
  }

  void _create2DArray() {
    int size = 4;
    for (int i = 0; i < size; i++) {
      List<String> subList = [];
      for (int j = 0; j < 4; j++) {
        subList.add(shuffledList[i * size + j]);
      }
      numbers2D.add(subList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifteen game", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<PuzzleBloc, PuzzleState>(
        builder: (context, state) {
          if (state is PuzzleUpdatedState) {
            numbers2D = state.grid;
          }

          return GridView.builder(
            itemCount: shuffledList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              int row = index ~/ 4;
              int col = index % 4;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<PuzzleBloc>(context).add(OnPressedEvent(
                    row: row,
                    col: col,
                  ));
                },
                child: Gridbutton(number: numbers2D[row][col]),
              );
            },
          );
        },
      ),
    );
  }
}
