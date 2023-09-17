import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              header('User Name', 1),
              header('Total Items', 1),
              header('Price', 1),
              header('Transaction Id', 1),
              header('Payment Id', 1),
              header('Phone', 1),
              header('Order Created Date', 2),
            ],
          ),
          Expanded(
            flex: 10,
            child: ListView.separated(
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        value('Afran Sarkar', 1),
                        value('3', 1),
                        value('1100 tk', 1),
                        value('AID10DOOT1', 1),
                        value('TR0011a2xspBN1694606204556', 1),
                        value('01770618576', 1),
                        value('September 13, 2023 at 5.59:01 PM', 2),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return Divider();
                },
                itemCount: 50),
          ),
        ],
      ),
    );
  }
}

Widget header(String title, int flex) {
  return Flexible(
    fit: FlexFit.tight,
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    flex: flex,
  );
}

Widget value(String title, int flex) {
  return Flexible(
    fit: FlexFit.tight,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    flex: flex,
  );
}
