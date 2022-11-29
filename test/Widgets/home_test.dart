import 'package:etiya_task/feature/Home/cubit/home_cubit.dart';
import 'package:etiya_task/feature/Home/home_view.dart';
import 'package:etiya_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Home Page Widgets Test", () {
    testWidgets("Search Widget Test", (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomeCubit(),
          child: MaterialApp(home: Material(child: SearchWidget())),
        ),
      );
      var search_text = find.byType(TextField);
      await tester.enterText(search_text, "Turkey");
      expect(find.text("Turkey"), findsOneWidget);
    });
    testWidgets("ListView.Builder and Cards Test ",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => HomeCubit(),
            child:
                const MaterialApp(home: Material(child: BuildListCountries())),
          ),
        );
      });
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
