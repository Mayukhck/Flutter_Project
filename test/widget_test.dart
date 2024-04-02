import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app/gradient_container.dart';
import 'package:first_app/dice_roller.dart';

void main() {
  testWidgets('GradientContainer displays correctly', (WidgetTester tester) async {
    
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

    
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.gradient, isInstanceOf<LinearGradient>());
    final gradient = decoration.gradient as LinearGradient;
    expect(gradient.colors, equals([const Color.fromARGB(255, 18, 1, 46), const Color.fromARGB(255, 114, 73, 185)]));

    
    expect(find.byType(DiceRoller), findsOneWidget);
  });

  testWidgets('Test DiceRoller Widget', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiceRoller())));

    
    final diceRollerFinder = find.byType(DiceRoller);
    expect(diceRollerFinder, findsOneWidget);

    
    final rollDiceButtonFinder = find.text('Roll Dice');
    expect(rollDiceButtonFinder, findsOneWidget);

    
    await tester.tap(rollDiceButtonFinder);
    await tester.pump();

    
    expect(find.byType(Image), findsOneWidget);
  });
}
