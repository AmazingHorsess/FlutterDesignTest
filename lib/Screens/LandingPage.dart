
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/custom/BorderBox.dart';
import 'package:namer_app/utils/constants.dart';
import 'package:namer_app/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double padding = 25;
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final sidePaddding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        )),
                    BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ))
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: PADDING,
                child: Text(
                  "City",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: PADDING,
                child: Text(
                  "San Francisco",
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: sidePaddding,
                child: Divider(
                  height: padding,
                  color: COLOR_GREY,
                ),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                      .map((filter) => ChoiceOption(text: filter)).toList(),
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget{
  final String text;


  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context){
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin:  const EdgeInsets.only(left: 25),
      child: Text(text,style: themeData.textTheme.headline5),

    );
  }
}
