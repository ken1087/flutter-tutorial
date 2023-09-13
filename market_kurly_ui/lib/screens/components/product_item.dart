import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/models/product_details_arguments.dart';
import 'package:market_kurly_ui/screens/details/details_screen.dart';
import 'package:market_kurly_ui/string_extensions.dart';
import 'package:market_kurly_ui/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    this.lineChange,
    this.textContainerHeight = 80,
  }) : super(key: key);

  final Product product;
  final bool? lineChange;
  final double? textContainerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              // 화면이동시 객체 전달
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: ProductDetailsArguments(product: product),
              );
            },
            child: Image.network(
              product.imageUrl ?? "assets/images/kurly_banner_0.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: textContainerHeight,
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: " ${product.title} ${lineChange == true ? "\n" : ""}",
                    style: textTheme().subtitle1),
                TextSpan(
                  text: " ${product.discount}%",
                  style: textTheme().headline2?.copyWith(color: Colors.red),
                ),
                TextSpan(
                  text:
                      discountPrice(product.price ?? 0, product.discount ?? 0),
                  style: textTheme().headline2,
                ),
                TextSpan(
                  text: "${product.price.toString().numberFormat()}원",
                  style: textTheme().bodyText2?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  String discountPrice(int price, int discount) {
    double discountRate = ((100 - discount) / 100);
    int discountPrice = (price * discountRate).toInt();
    return "${discountPrice.toString().numberFormat()}원";
  }
}
