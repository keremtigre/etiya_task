// ignore_for_file: file_names, prefer_const_constructors, unused_element

part of covidData_view.dart;

class _CountryInfo extends StatelessWidget
    with NetworkImagePathExtansion, NumberFormat {
  const _CountryInfo(
      {super.key, required this.countryName, required this.response});
  final String countryName;
  final CovidDataResponse response;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 6,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(1, 1))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Covid Data Page Country Info
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: context.width / 20),
                child: toNetworkImageWidget(
                    country_name: countryName.toLowerCase(),
                    height: context.height / 10,
                    width: context.width / 5),
              ),
              Spacer(),
            ],
          ),
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: context.width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "${CovidDataPageStrings.population}:   ${numberFormat((response.population ?? 0))}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${CovidDataPageStrings.date}:   ${response.day}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${CovidDataPageStrings.continent}:   ${response.continent}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 18),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
