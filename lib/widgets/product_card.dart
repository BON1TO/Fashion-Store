import 'package:flutter/material.dart';
import 'package:suryasrii_ecommerce/model/product.dart';
import 'package:suryasrii_ecommerce/pages/product_detail.dart';
import 'package:suryasrii_ecommerce/themes/light_color.dart';
import 'package:suryasrii_ecommerce/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Container(
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: borderRadius,
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProductDetailPage()),
            );
            onSelected(product);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      product.isliked ? Icons.favorite : Icons.favorite_border,
                      color: product.isliked ? LightColor.red : LightColor.iconColor,
                    ),
                    onPressed: () {
                      // hook up your like toggle here
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (product.isSelected) const SizedBox(height: 15),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: LightColor.orange.withAlpha(40),
                          ),
                          // Ensure product.image is a valid asset path.
                          Image.asset(product.image, fit: BoxFit.contain),
                        ],
                      ),
                    ),
                    TitleText(
                      text: product.name,
                      fontSize: product.isSelected ? 16 : 14,
                    ),
                    TitleText(
                      text: product.category,
                      fontSize: product.isSelected ? 14 : 12,
                      color: LightColor.orange,
                    ),
                    TitleText(
                      text: '₹ ${product.price}',
                      fontSize: product.isSelected ? 18 : 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
