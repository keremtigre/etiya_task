part of home_view.dart;

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) async {
        await context.read<HomeCubit>().textFormOnChanged(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.3),
        filled: true,
        labelText: "Aramak istediğiniz ülkeyi giriniz",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        hintText: "Aramak istediğiniz ülkeyi giriniz",
        prefixText: ' ',
      ),
    );
  }
}
