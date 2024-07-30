import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:news_app/widget/app_dimensions.dart';
import 'package:news_app/widget/custom_snack_bar.dart';
import 'package:news_app/widget/item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Form(
            key: _key,
            child: Container(
              child: TextFormField(
                controller: controller,
                onChanged: (value) {
                  search = [];
                  cubit.getDataSearch(q: value, data: search);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
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
            return controller.text.isEmpty || state is GetDataLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: search.length,
                            itemBuilder: (context, index) {
                              return Item(article: search[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  );
          },
        ));
  }
}
