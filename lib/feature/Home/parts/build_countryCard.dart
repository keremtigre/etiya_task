part of home_view.dart;

class BuildCard extends StatelessWidget
    with NetworkImagePathExtansion, LottiePathEnumExtension {
  const BuildCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.router.push(CovidDataRoute(
              countryName:
                  context.read<HomeCubit>().tempCountry[index].toString()));
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
                      errorWidget: toWidget(LottiePathEnum.loading.name),
                      country_name: context
                          .watch<HomeCubit>()
                          .tempCountry[index]
                          .toString()
                          .toLowerCase()),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                      context.watch<HomeCubit>().tempCountry[index].toString()),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ));
  }
}
