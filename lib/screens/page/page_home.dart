import 'package:flutter/material.dart';

import '../../models/text_edit.dart';

class PageHome extends StatelessWidget {
  const PageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SizedBox(
            height: 200,
            child: Image.network(
                'https://images.squarespace-cdn.com/content/v1/5648e25be4b00accac880a0e/1457644713650-UD0301XZBAC9649KAE1R/shop-online.png'),
          ),
        ),
        const TextEdit(
          colort: Colors.black,
          fontwb: FontWeight.bold,
          fonts: 20,
          padtop: 15,
          text: 'ຍັງບໍ່ມີການເຄືອນໄຫວໃດໆໃນມື້ນີ້',
        ),
        const TextEdit(
          colort: Colors.black,
          fonts: 15,
          padtop: 10,
          text: 'ອອກໄປຮັບອໍເດີກັນເລີຍ',
        ),
      ],
    );
  }
}