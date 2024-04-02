import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/gradient_container.dart';
import 'package:first_app/dice_roller.dart';

void main() {
  testWidgets('GradientContainer displays correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            Color.fromARGB(255, 18, 1, 46),
            Color.fromARGB(255, 114, 73, 185),
          ),
        ),
      ),
    );

    // Verify that GradientContainer is rendered with correct colors
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.gradient, isInstanceOf<LinearGradient>());
    final gradient = decoration.gradient as LinearGradient;
    expect(gradient.colors, equals([const Color.fromARGB(255, 18, 1, 46), const Color.fromARGB(255, 114, 73, 185)]));

    // Verify that DiceRoller widget is rendered inside GradientContainer
    expect(find.byType(DiceRoller), findsOneWidget);
  });

  testWidgets('Test DiceRoller Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiceRoller())));

    // Find the DiceRoller widget
    final diceRollerFinder = find.byType(DiceRoller);
    expect(diceRollerFinder, findsOneWidget);

    // Find the Roll Dice button
    final rollDiceButtonFinder = find.text('Roll Dice');
    expect(rollDiceButtonFinder, findsOneWidget);

    // Tap the Roll Dice button
    await tester.tap(rollDiceButtonFinder);
    await tester.pump();

    // Verify that the image updates after rolling the dice
    expect(find.byType(Image), findsOneWidget);
  });
}
