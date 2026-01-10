
import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key, required this.onTap, required this.selected, required this.title});

  final VoidCallback onTap;
  final int selected ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            SizedBox(height: 10),
            Container(
              height: 1, color:  selected ==1 ? Colors.orange : Colors.grey,
              width: MediaQuery.sizeOf(context).width / 2,
            )
          ],
        ),
      )
    );

  }

}
