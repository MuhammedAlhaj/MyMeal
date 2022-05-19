

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymeal/constans/font_family.dart';
import 'package:mymeal/ui/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image, required this.title, required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(image: 'assets/images/Find food.png',
        title: 'Find Food You Love',
        body: 'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep'),
    BoardingModel(image: 'assets/images/Delivery.png',
        title: 'Fast Delivery',
        body: 'Fast food delivery to your home, office wherever you are'),
    BoardingModel(image: 'assets/images/Live tracking.png',
        title: 'Live Tracking',
        body: 'Real time tracking of your food on the app once you placed the order')
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const login()),(Route<dynamic>route)=> false,
            );
          }, child: Text('SKIP',style: TextStyle(fontSize: 20,color: Colors.deepOrange),),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index){
                  if (index==boarding.length  -1){
                    setState(() {
                      isLast=true;
                    });
                    print('last');
                  }
                  else{

                    setState(() {
                      isLast=false;
                    });
                    print('not last');
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController, count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    activeDotColor: Colors.deepOrange,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(

                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),(Route<dynamic>route)=> false,
                      );
                    } else {
                      boardController.nextPage(duration: Duration(
                        microseconds: 750,
                      ), curve: Curves.fastLinearToSlowEaseIn);
                    }
                    },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

Widget buildBoardingItem(BoardingModel model) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            )),
        Text('${model.title}', style: TextStyle(
          fontSize: 24.0,
        ),),
        SizedBox(height: 15,),
        Text('${model.body}', style: TextStyle(
          fontSize: 14.0,

        ),),
        SizedBox(height: 15,),


      ],
    );
}
