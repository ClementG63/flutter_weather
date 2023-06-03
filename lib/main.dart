import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/domain/usecase/get_current_location.dart';
import 'package:flutter_weather/domain/usecase/get_forecast_for_location.dart';
import 'package:flutter_weather/presentation/view/home_page.dart';
import 'package:flutter_weather/presentation/view_model/forecast_viewmodel.dart';
import 'package:flutter_weather/presentation/view_model/weather_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<GetCurrentLocation>(GetCurrentLocation());
  getIt.registerSingleton<GetForecastForLocation>(GetForecastForLocation());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        scheme: FlexScheme.brandBlue,
        useMaterial3: true,
        textTheme: TextTheme(
          labelSmall: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ).copyWith(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherViewModel()),
          ChangeNotifierProvider(create: (_) => ForecastViewModel()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
