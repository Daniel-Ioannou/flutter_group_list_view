import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'index_path.dart';

typedef ItemWidgetBuilder = Widget Function(
    BuildContext context, IndexPath index);
typedef SectionWidgetBuilder = Widget Function(
    BuildContext context, int section);

class GroupListView extends StatefulWidget {
  final int sectionsCount;
  final ItemWidgetBuilder itemBuilder;
  final SectionWidgetBuilder groupHeaderBuilder;
  final int Function(int section) countOfItemInSection;

  //Fields from ListView.builder constructor
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double itemExtent;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;

  const GroupListView({
    Key key,
    @required this.itemBuilder,
    @required this.sectionsCount,
    @required this.groupHeaderBuilder,
    @required this.countOfItemInSection,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  List<IndexPath> _indexToIndexPathList;

  @override
  void initState() {
    _indexToIndexPathList = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calculateIndexPath();
    return ListView.builder(
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        IndexPath indexPath = _indexToIndexPathList[index];
        if (indexPath.index != null)
          return widget.itemBuilder(context, indexPath);
        return widget.groupHeaderBuilder(context, indexPath.section);
      },
    );
  }

  void _calculateIndexPath() {
    _indexToIndexPathList = List();
    for (int section = 0; section < widget.sectionsCount; section++) {
      _indexToIndexPathList.add(IndexPath(section: section, index: null));

      int rows = widget.countOfItemInSection(section);
      for (int index = 0; index < rows; index++) {
        _indexToIndexPathList.add(IndexPath(section: section, index: index));
      }
    }
  }

  int get _itemCount {
    int itemCount = 0;
    for (var index = 0; index < widget.sectionsCount; index++) {
      itemCount += widget.countOfItemInSection(index);
    }
    return itemCount + widget.sectionsCount;
  }
}
