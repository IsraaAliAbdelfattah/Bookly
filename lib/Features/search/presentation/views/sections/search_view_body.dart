import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../widgets/custom_search_text_field.dart';
import '../widgets/search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
