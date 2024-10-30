import 'package:flutter/material.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Text('data');
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
