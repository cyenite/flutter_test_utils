// ignore_for_file: depend_on_referenced_packages

library flutter_test_utils;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class FlutterTestUtils {
  /// Helper method for waiting until a widget is found in the widget tree
  /// before running tests. This is useful when testing asynchronous operations
  /// such as network calls or animations.
  static Future<void> waitForWidget(Finder finder, WidgetTester tester,
      {Duration timeout = const Duration(seconds: 5)}) async {
    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < timeout) {
      if (finder.evaluate().isNotEmpty) {
        return;
      }
      await tester.pumpAndSettle(const Duration(milliseconds: 10));
    }

    throw Exception('Widget ${finder.toString()} not found after $timeout');
  }

  /// Helper method for testing widget animations. This method wraps the
  /// `tester.pumpWidget` method with a loop that allows testing widget
  /// animations over time.
  static Future<void> pumpWidgetWithAnimation(
      Widget widget, WidgetTester tester,
      {Duration duration = const Duration(seconds: 1)}) async {
    final stopwatch = Stopwatch()..start();

    do {
      tester.pumpWidget(widget);
      await tester.pump(const Duration(milliseconds: 10));
    } while (stopwatch.elapsed < duration);
  }

  /// Helper method for testing the state of a widget after a duration of time.
  /// This method wraps the `tester.pumpAndSettle` method with a loop that allows
  /// testing the widget state over time.
  static Future<void> testWidgetState(Widget widget, WidgetTester tester,
      {Duration duration = const Duration(seconds: 1)}) async {
    tester.pumpWidget(widget);
    await tester.pump(const Duration(milliseconds: 10));
    final stopwatch = Stopwatch()..start();

    do {
      await tester.pumpAndSettle(const Duration(milliseconds: 10));
    } while (stopwatch.elapsed < duration);
  }

  /// Helper method for testing the behavior of a widget when an item is tapped.
  static Future<void> testWidgetTap(Widget widget, WidgetTester tester) async {
    await tester.pumpWidget(widget);
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();
    // Add assertions to check the expected behavior
  }

  /// Helper method for testing the behavior of a widget when an item is long-pressed.
  static Future<void> testWidgetLongPress(
      Widget widget, WidgetTester tester) async {
    await tester.pumpWidget(widget);
    await tester.longPress(find.byType(GestureDetector));
    await tester.pump();
    // Add assertions to check the expected behavior
  }

  /// Helper method for testing the behavior of a widget when an item is scrolled.
  static Future<void> testWidgetScroll(
      Widget widget, WidgetTester tester, double scrollAmount) async {
    await tester.pumpWidget(widget);
    await tester.drag(find.byType(ListView), Offset(0, scrollAmount));
    await tester.pump();
    // Add assertions to check the expected behavior
  }

  /// Helper method for testing the presence of a dialog in the widget tree.
  static Future<void> testWidgetDialog(
      WidgetTester tester, Finder dialogFinder) async {
    await tester.pumpAndSettle();
    expect(dialogFinder, findsOneWidget);
  }

  /// Helper method for testing the presence of a snackbar in the widget tree.
  static Future<void> testWidgetSnackbar(
      WidgetTester tester, String snackbarText) async {
    ScaffoldMessenger.of(tester.element(find.byType(Scaffold))).showSnackBar(
      SnackBar(content: Text(snackbarText)),
    );
    await tester.pumpAndSettle();
    expect(find.text(snackbarText), findsOneWidget);
  }

  /// Helper method for testing the absence of a widget in the widget tree.
  static Future<void> testWidgetAbsence(
      WidgetTester tester, Finder widgetFinder) async {
    await tester.pumpAndSettle();
    expect(widgetFinder, findsNothing);
  }
}
