part of home_view.dart;

class BuildListCountries extends StatelessWidget {
  const BuildListCountries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchWidget(),
        context.read<HomeCubit>().tempCountry.isEmpty
            ? _BuildNoDataFoundTextWidget()
            : const SizedBox(),
        Flexible(
            child: ListView.builder(
          itemCount: context.watch<HomeCubit>().tempCountry.length,
          itemBuilder: (context, index) {
            return BuildCard(
              index: index,
            );
          },
        )),
      ],
    );
  }
}

