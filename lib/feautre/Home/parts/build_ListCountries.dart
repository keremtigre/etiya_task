// ignore_for_file: unnecessary_string_interpolations

part of home_view.dart;

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SearchWidget(),
        Flexible(
          child: context.read<HomeCubit>().tempCountry.length > 0
              ? ListView.builder(
                  itemCount: context.watch<HomeCubit>().tempCountry.length,
                  itemBuilder: (context, index) {
                    return _BuildCard(
                      index: index,
                    );
                  },
                )
              : Center(
                  child: Text("No data found to list."),
                ),
        ),
      ],
    );
  }
}
