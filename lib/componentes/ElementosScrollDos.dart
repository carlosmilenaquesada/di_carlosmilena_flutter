import 'package:flutter/material.dart';

class ItemRedondeado extends StatelessWidget {
  String url;
  ItemRedondeado(this.url);

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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(110.0),
                    ),


                child: ClipOval(
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


