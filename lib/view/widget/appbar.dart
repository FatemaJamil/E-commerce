import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double height;

  CustomAppBar({

    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200))
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CircleAvatar(child:  Image.asset( "assets/icons/back.png"),)),
            Image.asset( height: 30 ,"assets/icons/logo_app.png"),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
