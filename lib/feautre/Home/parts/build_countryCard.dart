// ignore_for_file: unnecessary_string_interpolations

part of home_view.dart;

class BuildCard extends StatelessWidget
    with NetworkImagePathExtansion, LottiePathEnumExtension {
  BuildContext context;
  BuildCard({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SearchWidget(),
        Flexible(
          child: ListView.builder(
            itemCount: context.read<HomeCubit>().tempCountry.length,
            itemBuilder: (context, index) {
              final _country =
                  context.watch<HomeCubit>().tempCountry[index].toString();
              return GestureDetector(
                onTap: () {
                  context.router.push(CovidDataRoute(countryName: _country));
                },
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          toNetworkImageWidget(
                              height: 50,
                              width: 50,
                              errorWidget:
                                  toWidget(LottiePathEnum.loading.name),
                              country_name: _country.toLowerCase()),
                          const SizedBox(
                            width: 20,
                          ),
                          Text("${_country}"),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
