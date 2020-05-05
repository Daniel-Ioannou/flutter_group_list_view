import 'package:flutter/material.dart';

import 'index_path.dart';

typedef ItemWidgetBuilder = Widget Function(BuildContext context, IndexPath index);
typedef SectionWidgetBuilder = Widget Function(BuildContext context, int section);

class GroupListView extends StatefulWidget {
  final int sectionsCount;
  final ItemWidgetBuilder itemBuilder;
  final SectionWidgetBuilder groupHeaderBuilder;
  final int Function(int section) countOfItemInSection;

  const GroupListView({
    Key key,
    @required this.itemBuilder,
    @required this.sectionsCount,
    @required this.groupHeaderBuilder,
    @required this.countOfItemInSection,
  }) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        IndexPath indexPath = _getIndexPath(index);
        if (indexPath.index != null)
          return widget.itemBuilder(context, indexPath);
        return widget.groupHeaderBuilder(context, indexPath.section);
      },
    );
  }

  int get _itemCount {
    int itemCount = 0;
    for (var index = 0; index < widget.sectionsCount; index++) {
      itemCount += widget.countOfItemInSection(index);
    }
    return itemCount + widget.sectionsCount;
  }

  IndexPath _getIndexPath(int index) {
    if (index == 0) {
      return IndexPath(section: 0);
    }
    for (var section = 0; section < widget.sectionsCount; section++) {
      int used = 1;
      for (var i = section - 1; i >= 0; i--) {
        used += widget.countOfItemInSection(i) + 1;
      }

      if (index == used - 1) return IndexPath(section: section);

      if ((widget.countOfItemInSection(section) + used) > index) {
        return IndexPath(section: section, index: index - used);
      }
    }
    return null;
  }
}
