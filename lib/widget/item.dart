import 'package:flutter/material.dart';
import 'package:news_app/layout/web_view/web_view.dart';
import 'package:news_app/widget/app_dimensions.dart';
import 'package:news_app/widget/text.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.article});
  final dynamic article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return WebViewScreen(url: article["url"]);
          },
        ));
      },
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: article["urlToImage"] == null
                  ? Icon(
                      Icons.newspaper,
                      size: getRes(context, 170),
                    )
                  : Image.network(
                      article["urlToImage"],
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              width: getRes(context, 5),
            ),
            SizedBox(
              height: getRes(context, 150),
              width: getRes(context, 180),
              child: Column(
                children: [
                  Text(
                    article["title"],
                    maxLines: 3,
                    style: TextStyle(fontSize: getRes(context, 14)),
                  ),
                  Spacer(),
                  TextWidget(
                    text: article["publishedAt"],
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
