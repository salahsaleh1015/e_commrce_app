
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: 
        Column(
          children: [
            SizedBox(
                height: size.height*0.6,
                width: size.width*0.5,

                child: SvgPicture.asset("assets/images/complete.svg")),
            SizedBox(
              height: 30.h,
            ),

          ],
        ),
      ),
    );
  }
}
