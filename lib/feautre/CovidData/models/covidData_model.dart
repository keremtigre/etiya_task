class CovidDataModel {
  List<CovidDataResponse>? response;
  String? error;
  CovidDataModel({this.response});

  CovidDataModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <CovidDataResponse>[];
      json['response'].forEach((v) {
        response!.add(new CovidDataResponse.fromJson(v));
      });
    }
  }
  CovidDataModel.withError(this.error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
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
      {this.continent,
      this.country,
      this.population,
      this.cases,
      this.deaths,
      this.tests,
      this.day,
      this.time});

  CovidDataResponse.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    country = json['country'];
    population = json['population'];
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
    deaths =
        json['deaths'] != null ? new Deaths.fromJson(json['deaths']) : null;
    tests = json['tests'] != null ? new Tests.fromJson(json['tests']) : null;
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['continent'] = this.continent;
    data['country'] = this.country;
    data['population'] = this.population;
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    if (this.deaths != null) {
      data['deaths'] = this.deaths!.toJson();
    }
    if (this.tests != null) {
      data['tests'] = this.tests!.toJson();
    }
    data['day'] = this.day;
    data['time'] = this.time;
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

  Cases(
      {this.newCases,
      this.active,
      this.critical,
      this.recovered,
      this.s1MPop,
      this.total});

  Cases.fromJson(Map<String, dynamic> json) {
    newCases = json['new'];
    active = json['active'];
    critical = json['critical'];
    recovered = json['recovered'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new'] = this.newCases;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['recovered'] = this.recovered;
    data['1M_pop'] = this.s1MPop;
    data['total'] = this.total;
    return data;
  }
}

class Deaths {
  String? newDeaths;
  String? s1MPop;
  int? total;

  Deaths({this.newDeaths, this.s1MPop, this.total});

  Deaths.fromJson(Map<String, dynamic> json) {
    newDeaths = json['new'];
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new'] = this.newDeaths;
    data['1M_pop'] = this.s1MPop;
    data['total'] = this.total;
    return data;
  }
}

class Tests {
  String? s1MPop;
  int? total;

  Tests({this.s1MPop, this.total});

  Tests.fromJson(Map<String, dynamic> json) {
    s1MPop = json['1M_pop'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1M_pop'] = this.s1MPop;
    data['total'] = this.total;
    return data;
  }
}
