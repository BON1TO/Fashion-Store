import 'package:flutter/material.dart';
import 'package:suryasrii_ecommerce/model/category.dart';
import 'package:suryasrii_ecommerce/themes/light_color.dart';
import 'package:suryasrii_ecommerce/themes/theme.dart';
import 'package:suryasrii_ecommerce/widgets/title_text.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;

  const ProductIcon({
    Key? key,
    required this.model,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.id == null) return const SizedBox(width: 5);

    final isSelected = model.isSelected;
    final borderRadius = BorderRadius.circular(10);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Material(
        color: isSelected ? LightColor.background : Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () => onSelected(model),
          child: Container(
            padding: AppTheme.hPadding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: isSelected ? LightColor.background : Colors.transparent,
              border: Border.all(
                color: isSelected ? LightColor.purple : LightColor.grey, // ✅ fixed
                width: isSelected ? 2 : 1,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: isSelected ? const Color(0xfffbf2ef) : Colors.white,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (model.image != null && model.image!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(model.image!, height: 24),
                  ),
                if (model.name != null && model.name!.isNotEmpty)
                  TitleText(
                    text: model.name!,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
