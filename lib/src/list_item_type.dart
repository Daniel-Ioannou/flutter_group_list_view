enum ListItemType { section, separator, item }

extension PageTypeExtension on ListItemType {
  bool get isItem => this == ListItemType.item;

  bool get isSection => this == ListItemType.section;

  bool get isSeparator => this == ListItemType.separator;
}
