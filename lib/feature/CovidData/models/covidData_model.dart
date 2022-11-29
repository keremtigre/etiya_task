// ignore_for_file: file_names, prefer_collection_literals

class CovidDataModel {
  List<CovidDataResponse>? response;
  String? error;
  CovidDataModel({response});

  CovidDataModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <CovidDataResponse>[];
      json['response'].forEach((v) {
        response!.add(CovidDataResponse.fromJson(v));
      });
    }
  }
  CovidDataModel.withError(this.error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CovidDataResponse {
  String? continent;
  String? country;
  int? population;
  Cases? cases;
  Deaths? deaths;
  Tests? tests;
  String? day;
  String? time;

  CovidDataResponse(
      {continent, country, population, cases, deaths, tests, day, time});

  CovidDataResponse.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    country = json['country'];
    population = json['population'];
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    deaths = json['deaths'] != null ? Deaths.fromJson(json['deaths']) : null;
    tests = json['tests'] != null ? Tests.fromJson(json['tests']) : null;
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['continent'] = continent;
    data['country'] = country;
    data['population'] = population;
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (deaths != null) {
      data['deaths'] = deaths!.toJson();
    }
    if (tests != null) {
      data['tests'] = tests!.toJson();
    }
    data['day'] = day;
    data['time'] = time;
    return data;
  }
}

class Cases {
  String? newCases;
  int? active;
  int? critical;
  int? recovered;
  String? s1MPop;
  int? total;

  Cases({newCases, active, critical, recovered, s1MPop, total});

  Cases.fromJson(Map<String, dynamic> json) {
    newCases = json['new'];
    active = json['active'];
    critical = json['critical'];
    recovered = json['recovered'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['new'] = newCases;
    data['active'] = active;
    data['critical'] = critical;
    data['recovered'] = recovered;
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}

class Deaths {
  String? newDeaths;
  String? s1MPop;
  int? total;

  Deaths({newDeaths, s1MPop, total});

  Deaths.fromJson(Map<String, dynamic> json) {
    newDeaths = json['new'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['new'] = newDeaths;
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}

class Tests {
  String? s1MPop;
  int? total;

  Tests({s1MPop, total});

  Tests.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['1M_pop'] = s1MPop;
    data['total'] = total;
    return data;
  }
}
