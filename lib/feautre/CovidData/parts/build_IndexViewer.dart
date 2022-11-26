part of covidData_view.dart;

Row _IndexViewer(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IndexViewerContainer(index: 0, currentIndex: context.watch<CovidDataCubit>().currentIndex),
      SizedBox(
        width: context.width / 20,
      ),
      IndexViewerContainer(index: 1, currentIndex: context.watch<CovidDataCubit>().currentIndex)
    ]);
  }