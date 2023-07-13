

# Flutter Test Utils

A set of helper methods for testing widgets in the Flutter framework.

## Installation

In your `pubspec.yaml` file, add the following dependency:



``` 
dependencies: 
    flutter_test_utils: ^1.0.0
```   
    
Then, run `flutter pub get` to install the package.

## Usage

Import the package in your test file:


`import 'package:flutter_test_utils/flutter_test_utils.dart';`

Then, you can use any of the available helper methods in your test cases. Here are the currently available helper methods:

### `waitForWidget`

This method waits until a widget is found in the widget tree before running tests. This is useful when testing asynchronous operations such as network calls or animations.

Example usage:

```dart  
testWidgets('Test widget with future', (WidgetTester tester) async { 
    final widget = MyWidgetWithFuture(); 
    await FlutterTestUtils.waitForWidget(find.byType(MyWidget), tester);  
    expect(find.byType(MyWidgetWithFuture), findsOneWidget); 
});  
```  

### `pumpWidgetWithAnimation`

This is a method for testing widget animations. This method wraps the `tester.pumpWidget` method with a loop that allows testing widget animations over time.

Example usage:

```dart  
testWidgets('Test widget animation', (WidgetTester tester) async { 
    final widget = MyWidget(); 
    await FlutterTestUtils.pumpWidgetWithAnimation(widget, tester); 
    expect(find.byType(MyWidget), findsOneWidget); 
});  
```  

### `testWidgetState`
Tests the state of a widget after a duration of time. This method wraps the `tester.pumpAndSettle` method with a loop that allows testing the widget state over time.

Example usage:

```dart  
testWidgets('Test widget state', (WidgetTester tester) async { 
    final widget = MyWidget(); 
    await  FlutterTestUtils.testWidgetState(widget, tester); 
    expect(find.byType(MyWidget), findsOneWidget); 
});  
```  

### `testWidgetTap`
Tests the behavior of a widget when an item is tapped.

Example usage:

```dart  
testWidgets('Test widget tap', (WidgetTester tester) async { 
    final widget = MyWidget(); 
    await  FlutterTestUtils.testWidgetTap(widget, tester); 
    expect(find.byType(MyOtherWidget), findsOneWidget); 
});  
```  

### `testWidgetLongPress`
This is a method for testing the behavior of a widget when an item is long-pressed.

Example usage:

```dart  
testWidgets('Test widget long press', (WidgetTester tester) async { 
    final widget = MyWidget(); 
    await  FlutterTestUtils.testWidgetLongPress(widget, tester); 
    expect(find.byType(MyOtherWidget), findsOneWidget); 
});  
```  

### `testWidgetScroll`
This is a method for testing the behavior of a widget when an item is scrolled.

Example usage:

```dart  
testWidgets('Test widget scroll', (WidgetTester tester) async { 
    final widget = MyWidget(); 
    await  FlutterTestUtils.testWidgetScroll(widget, tester, 100.0); 
    expect(find.byType(MyOtherWidget), findsOneWidget); 
});  
```  

### `testWidgetDialog(WidgetTester tester, Finder dialogFinder)`

Tests the presence of a dialog in the widget tree.

Example usage:

```dart  
await FlutterTestUtils.testWidgetDialog(tester, find.byType(Dialog));  
expect(find.byType(Dialog), findsOneWidget);  
```  

### `testWidgetSnackbar(WidgetTester tester, String snackbarText)`

Tests the presence of a snackbar in the widget tree.

Example usage:

```dart  
final snackbarText = 'Snackbar text';  
await FlutterTestUtils.testWidgetSnackbar(tester, snackbarText);  
expect(find.text(snackbarText), findsOneWidget);  
```  

### `testWidgetAbsence(WidgetTester tester, Finder widgetFinder)`

Tests the absence of a widget in the widget tree.

Example usage:


```dart  
final widget = MyWidget();  
await tester.pumpWidget(widget);  
await FlutterTestUtils.testWidgetAbsence(tester, find.byType(SnackBar));  
expect(find.byType(SnackBar), findsNothing);  
```  

## Contributing

If you find any bugs or have any suggestions for improvements, feel free to open an issue or a pull request on the [GitHub repository](https://github.com/cyenite/flutter_test_utils). Contributions are always welcome!

## License

This package is licensed under the MIT License. See the [LICENSE](https://github.com/cyenite/flutter_test_utils/blob/main/LICENSE) file for more information.
