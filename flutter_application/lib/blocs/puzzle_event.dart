sealed class PuzzleEvent {}

final class OnPressedEvent extends PuzzleEvent {
  final int row;
  final int col;

  OnPressedEvent({required this.row, required this.col});
}
