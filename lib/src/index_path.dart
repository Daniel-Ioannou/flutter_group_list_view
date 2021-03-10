class IndexPath {
  /// The the number of the section.
  final int section;

  /// The the number of the row in the [section].
  final int index;

  /// The Class that contains the [section] number
  /// and the [index] number in this section.
  IndexPath({required this.section, required this.index});
}
