# GroupListView package for Flutter. (Developers Preview)

A List with Headers like iOS UITableView section.

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 group_list_view: ^1.0.0
 ```
 
 In your dart file, import the library:

 ```Dart
import 'package:group_list_view/group_list_view.dart';
 ``` 
 
 Instead of using a `ListView` create a `GroupListView` Widget:
 
 ```Dart
  GroupListView(
    sectionsCount: _elements.keys.toList().length,
    countOfItemInSection: (int section) {
      return _elements.values.toList()[section].length;
    },
    itemBuilder: _itemBuilder,
    groupHeaderBuilder: (BuildContext context, int section) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          _elements.keys.toList()[section],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );
    },
  ),
```
