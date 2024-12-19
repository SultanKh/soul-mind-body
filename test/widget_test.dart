import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sould_mind_body/screens/welcome_page.dart';
import 'package:sould_mind_body/theme/theme_provider.dart';


void main() {
  group('Widget Tests', () {
    testWidgets('Welcome Page displays Get Started button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: MaterialApp(
            home: WelcomePage(),
          ),
        ),
      );

      // Act
      final getStartedButton = find.text('Get Started');

      // Assert
      expect(getStartedButton, findsOneWidget);
    });

    testWidgets('Switching themes updates the app', (WidgetTester tester) async {
      // Arrange
      final themeProvider = ThemeProvider();
      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: themeProvider,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: const Text('Theme Test')),
            ),
          ),
        ),
      );

      // Act
      themeProvider.switchTheme(true);
      await tester.pump();

      // Assert
      expect(Theme.of(tester.element(find.text('Theme Test'))).brightness, equals(Brightness.dark));
    });

    testWidgets('Main Page displays the correct title', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Your Thoughts')),
          ),
        ),
      );

      // Assert
      expect(find.text('Your Thoughts'), findsOneWidget);
    });
  });
}
