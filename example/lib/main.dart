import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_utils/flutter_test_utils.dart';

void main() {
  testWidgets('Test widget animation', (WidgetTester tester) async {
    final widget = MyWidget();
    await FlutterTestUtils.pumpWidgetWithAnimation(widget, tester);
    expect(find.byType(MyWidget), findsOneWidget);
  });

  testWidgets('Test widget with future', (WidgetTester tester) async {
    await FlutterTestUtils.waitForWidget(
        find.byType(MyWidgetWithFuture), tester);
    expect(find.byType(MyWidgetWithFuture), findsOneWidget);
  });
  testWidgets('Test widget state', (WidgetTester tester) async {
    final widget = MyWidget();
    await FlutterTestUtils.testWidgetState(widget, tester);
    expect(find.byType(MyWidget), findsOneWidget);
  });

  testWidgets('Test widget tap', (WidgetTester tester) async {
    final widget = MyWidget();
    await FlutterTestUtils.testWidgetTap(widget, tester);
    expect(find.byType(MyOtherWidget), findsOneWidget);
  });

  testWidgets('Test widget long press', (WidgetTester tester) async {
    final widget = MyWidget();
    await FlutterTestUtils.testWidgetLongPress(widget, tester);
    expect(find.byType(MyOtherWidget), findsOneWidget);
  });

  testWidgets('Test widget scroll', (WidgetTester tester) async {
    final widget = MyWidget();
    await FlutterTestUtils.testWidgetScroll(widget, tester, 100.0);
    expect(find.byType(MyOtherWidget), findsOneWidget);
  });

  testWidgets('Test widget dialog', (WidgetTester tester) async {
    final widget = MyWidget();
    await tester.pumpWidget(widget);
    await FlutterTestUtils.testWidgetDialog(tester, find.byType(Dialog));
    expect(find.byType(Dialog), findsOneWidget);
  });

  testWidgets('Test widget snackbar', (WidgetTester tester) async {
    final snackbarText = 'Snackbar text';
    await FlutterTestUtils.testWidgetSnackbar(tester, snackbarText);
    expect(find.text(snackbarText), findsOneWidget);
  });

  testWidgets('Test widget absence', (WidgetTester tester) async {
    final widget = MyWidget();
    await tester.pumpWidget(widget);
    await FlutterTestUtils.testWidgetAbsence(tester, find.byType(SnackBar));
    expect(find.byType(SnackBar), findsNothing);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyOtherWidget extends StatelessWidget {
  const MyOtherWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        height: 500.0,
      ),
    );
  }
}

class MyWidgetWithFuture extends StatefulWidget {
  const MyWidgetWithFuture({Key key}) : super(key: key);

  @override
  State<MyWidgetWithFuture> createState() => _MyWidgetWithFutureState();
}

class _MyWidgetWithFutureState extends State<MyWidgetWithFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (c, _) {
      return SizedBox.shrink();
    });
  }
}
