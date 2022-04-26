import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymeal/constans/font_family.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Card(
              elevation:2,
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),bottomRight: Radius.circular(22)),
              ),
              child: Stack(children: [
                Container(

                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 300,

                      child: CustomPaint(

                        painter: ProfileCard(
                          circleWidth: 80.0,
                        ),
                      ),
                    ),

                Padding(
                  padding: const EdgeInsets.only(top: 228.0),
                  child: Container(

                    //   alignment: Alignment(60, 60),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height:90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/splash.png'),
                            alignment: Alignment.center,
                            scale: 5)),
                  ),
                ),

              ]),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('My', style: TextStyle(fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                        fontFamily: FontFamily.productSans
                    ),),
                    Text(
                      "Meal",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontStyle: FontStyle.italic,
                          fontFamily: FontFamily.productSans

                      ),
                    ),
                  ],

                ),

                Text('FOOD DELIVERY', style: TextStyle(
                    fontSize: 14.0, color: Colors.grey[700], letterSpacing: 6),),

                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: Text(
                    'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                    style: TextStyle(fontSize: 15, color: Colors.grey[700],),
                    textAlign: TextAlign.center,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 96.0,bottom: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        fixedSize: const Size(300,60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create an Account',style: TextStyle(color:Colors.deepOrange),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: const Size(300,60),
                        shape: RoundedRectangleBorder(
                            side:BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),

              ],
            ),



          ],
        )

    );
  }
}
class ProfileCard extends CustomPainter {
  final circleWidth;

  ProfileCard({this.circleWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var fillPaint = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var wavePaint = Paint()
      ..color = Colors.blue[900]!.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width * 1 / 4, size.height * 1 / 4, size.width / 2,
        size.height / 2, size.width, 0);
    path.lineTo(size.width, size.height);

    var holePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Offset holeOffset = Offset(size.width / 2, size.height - circleWidth / 6);

    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), fillPaint);
    canvas.drawPath(path, wavePaint);
    canvas.drawCircle(holeOffset, circleWidth, holePaint);
  }

  @override
  bool shouldRepaint(ProfileCard oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ProfileCard oldDelegate) => false;
}
