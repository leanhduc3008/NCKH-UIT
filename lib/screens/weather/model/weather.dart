class Weather{

  Weather(
    {
      required this.location,
      required this.current,
      required this.forecast,
    }
  );

  factory Weather.fromJSON(Map<String, dynamic> parsedJson) {
    return Weather(
      location: Location.fromJSON(parsedJson['location']),
      current: Current.fromJSON(parsedJson['current']),
      forecast: Forecast.fromJSON(parsedJson['forecast']),
);
}
  Location location; 
  Current current;
  Forecast forecast;
}

class Location {

  Location(
    {
      required this.name,
      required this.localTime
    }
  );

  factory Location.fromJSON(Map<String, dynamic> parsedJson){
    return Location(
      name: parsedJson['name'], 
      localTime: parsedJson['localtime']
      );
  }
  String name;
  String localTime;
}

class Current {

  Current(
    {
      required this.temp,
      required this.pressure,
      required this.feelsLike,
      required this.uv,
      required this.condition
    }
  );

  factory Current.fromJSON(Map<String, dynamic> parsedJson){
    return Current(
      temp: parsedJson['temp_c'], 
      pressure: parsedJson['pressure_mb'],
      feelsLike: parsedJson['feelslike_c'],
      uv: parsedJson['uv'],
      condition: Conditions.fromJSON(parsedJson['condition'])
      );
  }
  double temp;
  double pressure;
  double feelsLike;
  double uv; 
  Conditions condition;

}

class Conditions {

  Conditions({required this.text, required this.icon});

  factory Conditions.fromJSON(Map<String, dynamic> parsedJson){
    return Conditions(
      text: parsedJson['text'],
      icon: parsedJson['icon']
      );
  }
  String text;
  String icon;
}

class Forecast {
  
  Forecast({required this.forecastdays});

  factory Forecast.fromJSON(Map<String, dynamic> parsedJson){
    return Forecast(
      forecastdays: (parsedJson['forecastday'] as List).map((i) =>Forecastday.fromJSON(i)).toList()
      );
  }
  List<Forecastday> forecastdays;

}

class Forecastday {

  Forecastday({required this.day});

  factory Forecastday.fromJSON(Map<String, dynamic> parsedJson){
    return Forecastday(
      day: Day.fromJSON(parsedJson['day'])
      );
  }
  Day day;
}

class Day {

  Day(
    {
      required this.minTemp,
      required this.maxTemp
    }
  );

  factory Day.fromJSON(Map<String, dynamic> parsedJson){
    return Day(
      minTemp: parsedJson['mintemp_c'],
      maxTemp: parsedJson['maxtemp_c']
      );
  }
  double minTemp;
  double maxTemp;
}

