## [1.1.1] - 10 Mar 2021

* Stable null-safe release

## [1.1.0] - 02 Mar 2021

* Migrated to null safety

## [1.0.6] - 21 Jul 2020

* Support `sectionSeparatorBuilder` 
  
  Separators only appear between sections: separator 0 appears after section 0 and the last separator appears after the last section.

```Dart
Widget sectionSeparatorBuilder(BuildContext context, int section) {
   return SizedBox(height: 10);
}
```  

## [1.0.5] - 04 Jun 2020

* Add assert for all the required parameters.
* Update documentation.
* Setting up Lint Rules.

## [1.0.4] - 20 May 2020

* Support `separatorBuilder`  
  
  Separators only appear between list items: separator 0 appears after item 0 and the last separator appears after the last item.

```Dart
Widget separatorBuilder(BuildContext context, IndexPath index) {
   return SizedBox(height: 10);
}
```  

## [1.0.3] - 12 May 2020

* Improve build performance.

## [1.0.2] - 10 May 2020

* Update documentation.

## [1.0.1] - 08 May 2020

* Support all fields from `ListView.builder` constructor.

## [1.0.0] - 06 May 2020

* Initial developers preview release.
