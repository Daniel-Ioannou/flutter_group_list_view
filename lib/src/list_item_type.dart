enum ListItemType { section, itemSeparator, sectionSeparator, item }

extension PageTypeExtension on ListItemType {
  bool get isItem => this == ListItemType.item;

  bool get isSection => this == ListItemType.section;

  bool get isItemSeparator => this == ListItemType.itemSeparator;

  bool get isSectionSeparator => this == ListItemType.sectionSeparator;
}
