import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('builder-level padding zero reaches SafeArea in home',
      (tester) async {
    tester.view.padding = const FakeViewPadding(bottom: 40, top: 0);
    addTearDown(tester.platformDispatcher.clearAllTestValues);

    late double safeAreaBottomSeenByChild;
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) {
          final mq = MediaQuery.of(context);
          return MediaQuery(
            data: mq.copyWith(
              padding: mq.padding.copyWith(bottom: 0),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: Builder(
          builder: (context) {
            safeAreaBottomSeenByChild = MediaQuery.paddingOf(context).bottom;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(safeAreaBottomSeenByChild, 0.0);
  });
}
