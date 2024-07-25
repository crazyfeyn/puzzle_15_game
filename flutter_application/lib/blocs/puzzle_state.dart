sealed class PuzzleState {}

final class InitialPuzzleState extends PuzzleState {}

final class PuzzleUpdatedState extends PuzzleState {
  final List<List<String>> grid;

  PuzzleUpdatedState({required this.grid});
}
