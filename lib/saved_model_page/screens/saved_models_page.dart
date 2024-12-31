import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/best_cart_item_party.dart';
import 'package:shop_style/common/widgets/card_item_party.dart';

class SavedModelsPage extends StatefulWidget {
  const SavedModelsPage({super.key});

  @override
  State<SavedModelsPage> createState() => _SavedModelsPageState();
}

class _SavedModelsPageState extends State<SavedModelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text('مدل های ذخیره شده'),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('مدل های ذخیره شده'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 242,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(right: 22),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: BestCardItemParty(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('کله پارتی!'),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 242,
                  width: 358,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 22),
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: CardItemParty(),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
