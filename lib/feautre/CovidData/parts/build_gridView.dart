part of covidData_view.dart;

class BuildGridView extends StatelessWidget {
  final String countryName;
  final CovidDataResponse response;
  const BuildGridView({super.key,required this.countryName,required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        _CountryInfo(countryName: countryName, response: response),
        _IndexViewer(context),
        Flexible(
            child: PageView.builder(
          onPageChanged: (value) {
            context.read<CovidDataCubit>().setCurrentIndex(value);
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [
                    CovidDataCard(
                      color: Colors.blue,
                      result: (index == 0
                              ? response.cases?.active ?? 0
                              : response.deaths?.total ?? 0)
                          .toString(),
                      title: index == 0
                          ? CovidDataPageStrings.activeCase
                          : CovidDataPageStrings.totalCase,
                    ),
                    CovidDataCard(
                      color: Colors.red,
                      result: index == 0
                          ? response.cases?.newCases ?? "0"
                          : response.deaths?.newDeaths ?? "0",
                      title: index == 0
                          ? CovidDataPageStrings.newCase
                          : CovidDataPageStrings.newDeaths,
                    ),
                    CovidDataCard(
                      color: Colors.green,
                      result: (index == 0
                              ? response.cases?.critical ?? 0
                              : response.deaths?.s1MPop ?? "")
                          .toString(),
                      title: index == 0
                          ? CovidDataPageStrings.criticalCase
                          : CovidDataPageStrings.s1MPop,
                    ),
                    index == 0
                        ? CovidDataCard(
                            color: Colors.amber,
                            result: (response.cases?.recovered ?? 0).toString(),
                            title: CovidDataPageStrings.recoverdCase,
                          )
                        : SizedBox(),
                    index == 0
                        ? CovidDataCard(
                            color: Colors.cyan,
                            result: (response.cases?.total ?? 0).toString(),
                            title: CovidDataPageStrings.totalCase,
                          )
                        : SizedBox(),
                    index == 0
                        ? CovidDataCard(
                            color: Colors.cyan,
                            result: (response.cases?.s1MPop ?? "0").toString(),
                            title: CovidDataPageStrings.s1MPop,
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            );
          },
        )),
      ],
    );
  }
}
