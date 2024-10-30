import 'package:bookly/Features/home/presentation/views/widget/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../widget/custom_app_bar.dart';
import '../widget/featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CutsomAppBar(),
                FeaturedBookListView(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}
