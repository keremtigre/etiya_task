// ignore_for_file: unnecessary_string_interpolations

part of home_view.dart;

class BuildListCountries extends StatelessWidget {
  const BuildListCountries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWidget(),
        Flexible(
            child: ListView.builder(
          itemCount: context.watch<HomeCubit>().tempCountry.length,
          itemBuilder: (context, index) {
            return BuildCard(
              index: index,
            );
          },
        )),
        context.read<HomeCubit>().tempCountry.length < 1
            ? SizedBox(
                height: context.height / 20,
                width: context.width,
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Text("No data found to list",)),
              )
            : SizedBox()
      ],
    );
  }
}
