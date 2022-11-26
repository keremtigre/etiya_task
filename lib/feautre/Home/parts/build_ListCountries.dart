part of home_view.dart;

class _BuildListCountries extends StatelessWidget with LottiePathEnumExtension {
  const _BuildListCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            scaffoldMessengerHelper(context, state.message ?? "", 5);
          }
        },
        builder: (context, state) {
          if (state is HomeInitial) {
            return toWidget(LottiePathEnum.loading.name);
          } else if (state is HomeLoading) {
            return toWidget(LottiePathEnum.loading.name);
          } else if (state is HomeLoaded) {
            return BuildCard(
              context: context,
            );
          } else if (state is HomeError) {
            return Center(
              child: toWidget(LottiePathEnum.error.name),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
