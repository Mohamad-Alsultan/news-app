import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:news_app/widget/app_dimensions.dart';
import 'package:news_app/widget/custom_snack_bar.dart';
import 'package:news_app/widget/item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetDataErrorConation) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,
              title: "Error",
              message: "check your internet ",
              backgroundColor: Colors.red,
              margin: EdgeInsets.only(bottom: getRes(context, 80))));
        }
      },
      builder: (context, state) {
        return state is GetDataLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: business.length,
                        itemBuilder: (context, index) {
                          return Item(article: business[index]);
                        },
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
