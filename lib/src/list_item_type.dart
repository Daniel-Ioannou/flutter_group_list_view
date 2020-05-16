enum ListItemType { section, separator, item }

extension PageTypeExtension on ListItemType {
  get isItem => this == ListItemType.item;

  get isSection => this == ListItemType.section;

  get isSeparator => this == ListItemType.separator;
}
