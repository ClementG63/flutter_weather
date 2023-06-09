import 'package:flutter/material.dart';
import 'package:flutter_weather/domain/entity/forecast.dart';
import 'package:flutter_weather/domain/entity/location.dart';
import 'package:flutter_weather/domain/entity/weather.dart';

class DetailedForecast extends StatelessWidget {
  final Location location;
  final Weather current;
  final List<Forecast>? forecast;

  const DetailedForecast({
    super.key,
    required this.location,
    required this.current,
    this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLocation(context),
          const SizedBox(height: 5),
          _buildImage(),
          _buildCondition(context),
          _buildTemperature(context),
          const SizedBox(height: 15),
          _buildWeatherDetailedStats(context),
        ],
      ),
    );
  }

  Row _buildWeatherDetailedStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Vitesse du vent",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${current.windKph} km/h",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Température ressentie",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${current.feelslikeC} °C",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 35),
        Column(
          children: [
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Humidité",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${current.humidity} %",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pression",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${current.pressureMb.toStringAsFixed(0)} hPa",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildTemperature(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          current.tempC.toStringAsFixed(0),
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "°C",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  SizedBox _buildCondition(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Text(
        current.condition.text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Image _buildImage() {
    return Image.network(
      current.condition.icon.replaceFirst("//", "http://"),
      scale: 1 * 0.7,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }

  Row _buildLocation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          location.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          "-",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 30,
          ),
        ),
        Text(
          location.country,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
