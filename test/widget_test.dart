import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/gradient_container.dart';
import 'package:first_app/dice_roller.dart';

void main() {
  testWidgets('Test GradientContainer Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
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

    // Find the GradientContainer widget
    final gradientContainerFinder = find.byType(GradientContainer);
    expect(gradientContainerFinder, findsOneWidget);

    // Check if GradientContainer contains DiceRoller widget
    final diceRollerFinder = find.byType(DiceRoller);
    expect(diceRollerFinder, findsOneWidget);
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
