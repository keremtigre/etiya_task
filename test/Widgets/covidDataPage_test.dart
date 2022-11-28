import 'package:etiya_task/feautre/CovidData/covidData_view.dart';
import 'package:etiya_task/feautre/CovidData/cubit/covid_data_cubit.dart';
import 'package:etiya_task/feautre/CovidData/models/covidData_model.dart';
import 'package:etiya_task/feautre/Home/cubit/home_cubit.dart';
import 'package:etiya_task/feautre/Home/home_view.dart';
import 'package:etiya_task/main.dart';
import 'package:etiya_task/product/Widget/covid_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

    testWidgets("Covid Data Page GridView Test", (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => CovidDataCubit(),
            child: MaterialApp(
                home: SingleChildScrollView(
              child: Container(
                  width: 400,
                  height: 1400,
                  child: BuildGridView(
                    countryName: "Turkey",
                    response: CovidDataResponse(),
                  )),
            )),
          ),
        );
        expect(find.text("Active Case"), findsOneWidget);
        expect(find.text("New Case"), findsOneWidget);
        expect(find.text("Critical Case"), findsOneWidget);
        expect(find.text("Recovered Case"), findsOneWidget);

      });
    });
  }
