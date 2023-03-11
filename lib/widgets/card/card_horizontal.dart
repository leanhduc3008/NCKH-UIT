import 'package:flutter/material.dart';

import '../../common/constants/theme.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({
    super.key,
    this.title = 'Placeholder Title',
    this.cta = '',
    this.img = 'https://via.hintText.com/200',
    this.tap = defaultFunc,
  });

  final String cta;
  final String img;
  final GestureTapCallback tap;
  final String title;

  static void defaultFunc() {
    debugPrint('the function works!');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 3,
            shadowColor: AppColors.muted.withOpacity(0.22),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0)),
                          image: DecorationImage(
                            image: NetworkImage(img),
                            fit: BoxFit.cover,
                          ))),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: AppColors.text, fontSize: 12)),
                      Text(cta,
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 11,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
