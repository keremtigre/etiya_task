part of home_view.dart;

class _BuildNoDataFoundTextWidget extends StatelessWidget {
  const _BuildNoDataFoundTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height / 40),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      height: context.height / 20,
      width: context.width / 1.2,
      child: const Text(
        HomePageStrings.no_data_text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
