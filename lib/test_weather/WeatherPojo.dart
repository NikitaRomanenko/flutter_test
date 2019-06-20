class WeatherPojo {
  dynamic latitude;
  dynamic longitude;
  String timezone;
  Currently currently;
  Hourly hourly;
  Daily daily;
  Flags flags;
  dynamic offset;

  WeatherPojo(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.currently,
      this.hourly,
      this.daily,
      this.flags,
      this.offset});

  WeatherPojo.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    currently = json['currently'] != null
        ? new Currently.fromJson(json['currently'])
        : null;
    hourly =
        json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timezone'] = this.timezone;
    if (this.currently != null) {
      data['currently'] = this.currently.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.toJson();
    }
    if (this.flags != null) {
      data['flags'] = this.flags.toJson();
    }
    data['offset'] = this.offset;
    return data;
  }
}

class Currently {
  dynamic time;
  String summary;
  String icon;
  dynamic precipIntensity;
  dynamic precipProbability;
  String precipType;
  dynamic temperature;
  dynamic apparentTemperature;
  dynamic dewPoint;
  dynamic humidity;
  dynamic pressure;
  dynamic windSpeed;
  dynamic windGust;
  dynamic windBearing;
  dynamic cloudCover;
  dynamic uvIndex;
  dynamic visibility;
  dynamic ozone;

  Currently(
      {this.time,
      this.summary,
      this.icon,
      this.precipIntensity,
      this.precipProbability,
      this.precipType,
      this.temperature,
      this.apparentTemperature,
      this.dewPoint,
      this.humidity,
      this.pressure,
      this.windSpeed,
      this.windGust,
      this.windBearing,
      this.cloudCover,
      this.uvIndex,
      this.visibility,
      this.ozone});

  Currently.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    summary = json['summary'];
    icon = json['icon'];
    precipIntensity = json['precipIntensity'];
    precipProbability = json['precipProbability'];
    precipType = json['precipType'];
    temperature = json['temperature'];
    apparentTemperature = json['apparentTemperature'];
    dewPoint = json['dewPoint'];
    humidity = json['humidity'];
    pressure = json['pressure'];
    windSpeed = json['windSpeed'];
    windGust = json['windGust'];
    windBearing = json['windBearing'];
    cloudCover = json['cloudCover'];
    uvIndex = json['uvIndex'];
    visibility = json['visibility'];
    ozone = json['ozone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    data['precipIntensity'] = this.precipIntensity;
    data['precipProbability'] = this.precipProbability;
    data['precipType'] = this.precipType;
    data['temperature'] = this.temperature;
    data['apparentTemperature'] = this.apparentTemperature;
    data['dewPoint'] = this.dewPoint;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['windSpeed'] = this.windSpeed;
    data['windGust'] = this.windGust;
    data['windBearing'] = this.windBearing;
    data['cloudCover'] = this.cloudCover;
    data['uvIndex'] = this.uvIndex;
    data['visibility'] = this.visibility;
    data['ozone'] = this.ozone;
    return data;
  }
}

class Hourly {
  String summary;
  String icon;
  List<Data> data;

  Hourly({this.summary, this.icon, this.data});

  Hourly.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    icon = json['icon'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic time;
  String summary;
  String icon;
  dynamic precipIntensity;
  dynamic precipProbability;
  dynamic precipAccumulation;
  String precipType;
  dynamic temperature;
  dynamic apparentTemperature;
  dynamic dewPoint;
  dynamic humidity;
  dynamic pressure;
  dynamic windSpeed;
  dynamic windGust;
  dynamic windBearing;
  dynamic cloudCover;
  dynamic uvIndex;
  dynamic visibility;
  dynamic ozone;

  Data(
      {this.time,
      this.summary,
      this.icon,
      this.precipIntensity,
      this.precipProbability,
      this.precipAccumulation,
      this.precipType,
      this.temperature,
      this.apparentTemperature,
      this.dewPoint,
      this.humidity,
      this.pressure,
      this.windSpeed,
      this.windGust,
      this.windBearing,
      this.cloudCover,
      this.uvIndex,
      this.visibility,
      this.ozone});

  Data.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    summary = json['summary'];
    icon = json['icon'];
    precipIntensity = json['precipIntensity'];
    precipProbability = json['precipProbability'];
    precipAccumulation = json['precipAccumulation'];
    precipType = json['precipType'];
    temperature = json['temperature'];
    apparentTemperature = json['apparentTemperature'];
    dewPoint = json['dewPoint'];
    humidity = json['humidity'];
    pressure = json['pressure'];
    windSpeed = json['windSpeed'];
    windGust = json['windGust'];
    windBearing = json['windBearing'];
    cloudCover = json['cloudCover'];
    uvIndex = json['uvIndex'];
    visibility = json['visibility'];
    ozone = json['ozone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    data['precipIntensity'] = this.precipIntensity;
    data['precipProbability'] = this.precipProbability;
    data['precipAccumulation'] = this.precipAccumulation;
    data['precipType'] = this.precipType;
    data['temperature'] = this.temperature;
    data['apparentTemperature'] = this.apparentTemperature;
    data['dewPoint'] = this.dewPoint;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['windSpeed'] = this.windSpeed;
    data['windGust'] = this.windGust;
    data['windBearing'] = this.windBearing;
    data['cloudCover'] = this.cloudCover;
    data['uvIndex'] = this.uvIndex;
    data['visibility'] = this.visibility;
    data['ozone'] = this.ozone;
    return data;
  }
}

class Daily {
  String summary;
  String icon;
  List<Data> data;

  Daily({this.summary, this.icon, this.data});

  Daily.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    icon = json['icon'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['icon'] = this.icon;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Flags {
  List<String> sources;
  String meteoalarmLicense;
  dynamic nearestStation;
  String units;

  Flags(
      {this.sources, this.meteoalarmLicense, this.nearestStation, this.units});

  Flags.fromJson(Map<String, dynamic> json) {
    sources = json['sources'].cast<String>();
    meteoalarmLicense = json['meteoalarm-license'];
    nearestStation = json['nearest-station'];
    units = json['units'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sources'] = this.sources;
    data['meteoalarm-license'] = this.meteoalarmLicense;
    data['nearest-station'] = this.nearestStation;
    data['units'] = this.units;
    return data;
  }
}
