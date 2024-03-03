import 'package:flutter/material.dart';

class ItemCuadrado extends StatelessWidget {
  String url;
  ItemCuadrado(this.url);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Container(
                height: 110.0,
                width: 110.0,
                child: Container(
                    child: Image.network(
                  url,
                  fit: BoxFit.cover,
                )))
          ],
        ),
      ],
    );
  }
}

