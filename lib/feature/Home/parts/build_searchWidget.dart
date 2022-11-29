part of home_view.dart;

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: context.read<HomeCubit>().searchTextController,
        onChanged: (value) async {
          await context.read<HomeCubit>().textFormOnChanged();
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.3),
          filled: true,
          labelText: HomePageStrings.search_hint_text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          hintText: HomePageStrings.search_hint_text,
          prefixText: ' ',
        ),
      ),
    );
  }
}
