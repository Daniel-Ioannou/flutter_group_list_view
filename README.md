# GroupListView package for Flutter.

[![pub package](https://img.shields.io/pub/v/group_list_view.svg)](https://pub.dev/packages/group_list_view)

A ListView that allows you to group list items and support headers like iOS UITableView section.

<img src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_group_list_view/master/assets/ReadMe%20%20Screenshot.png" width="300"> 

### Features
* List Items can be grouped.
* Support headers for each group.
* All fields from `ListView.builder` constructor available.

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 group_list_view: ^1.1.1
 ```
 
 In your dart file, import the library:

 ```Dart
import 'package:group_list_view/group_list_view.dart';
 ``` 
 
 Instead of using a `ListView` create a `GroupListView` Widget:
 
 ```Dart
  Map<String, List> _elements = {
    'Team A': ['Klay Lewis', 'Ehsan Woodard', 'River Bains'],
    'Team B': ['Toyah Downs', 'Tyla Kane'],
  };
  
  GroupListView(
    sectionsCount: _elements.keys.toList().length,
    countOfItemInSection: (int section) {
      return _elements.values.toList()[section].length;
    },
    itemBuilder: (BuildContext context, IndexPath index) {
      return Text(
        _elements.values.toList()[index.section][index.index],
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    },
    groupHeaderBuilder: (BuildContext context, int section) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          _elements.keys.toList()[section],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );
    },
    separatorBuilder: (context, index) => SizedBox(height: 10),
    sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
  );
```

### Parameters:
* `sectionsCount`: The number of sections in the ListView. (required)
* `countOfItemInSection`. Function which returns the number of items(rows) in a specified section. (required)
* `itemBuilder`: Function which returns an Widget which defines the item at the specified `IndexPath`. `itemBuilder` provides the current section and index. (required)
```Dart
  Widget _itemBuilder(BuildContext context, IndexPath index) {
     return Text('${_elements[index.section][index.index]}');
  }
```  
* `groupHeaderBuilder`: Function which returns an Widget which defines the section header for each group. (required)
* `separatorBuilder`: Function which returns an Widget which defines the divider/separator at the specified IndexPath.

  The `itemBuilder` and `separatorBuilder` callbacks should actually create widget instances when called. 

## Contributions
Contributions of any kind are more than welcome! Feel free to fork and improve country_code_picker in any way you want, make a pull request, or open an issue.
