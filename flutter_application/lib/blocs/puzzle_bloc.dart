import 'package:bloc/bloc.dart';
import 'package:flutter_application/blocs/puzzle_event.dart';
import 'package:flutter_application/blocs/puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  List<List<String>> grid;

  PuzzleBloc({required this.grid}) : super(InitialPuzzleState()) {
    on<OnPressedEvent>(_onPressedEvent);
  }

  void _onPressedEvent(OnPressedEvent event, Emitter<PuzzleState> emit) {
    final row = event.row;
    final col = event.col;
    
    if (canMove(row, col)) {
      swapTiles(row, col);
      emit(PuzzleUpdatedState(grid: List.from(grid)));
    }
  }

  bool canMove(int row, int col) {
    return (row > 0 && grid[row - 1][col] == '') ||
           (row < 3 && grid[row + 1][col] == '') ||
           (col > 0 && grid[row][col - 1] == '') ||
           (col < 3 && grid[row][col + 1] == '');
  }

  void swapTiles(int row, int col) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (grid[i][j] == '') {
          grid[i][j] = grid[row][col];
          grid[row][col] = '';
          return;
        }
      }
    }
  }
}
