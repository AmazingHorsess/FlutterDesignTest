
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/custom/BorderBox.dart';
import 'package:namer_app/custom/FloatOptionButton.dart';
import 'package:namer_app/data.dart';
import 'package:namer_app/utils/constants.dart';
import 'package:namer_app/utils/custom_functions.dart';
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
          child: Stack(
            children: [
              Column(
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
                  addVerticalSpace(10),

                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                          .map((filter) => ChoiceOption(text: filter)).toList(),
                    ),

                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePaddding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemCount:RE_DATA.length ,itemBuilder:  (context,index){
                        return ItemWidget(key: key, itemData: RE_DATA[index]);
                      }),
                    ),
                  )

                ],
              ),
              Positioned(
                  bottom: 25  ,
                  width: size.width,child: Center(
                    child: OptionButton(
                icon: Icons.map_rounded,
                text: "Map view",
                width: size.width*0.35,


              ),
                  ))
            ],
          )
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

class ItemWidget extends StatelessWidget{
  final dynamic itemData;


  const ItemWidget({required super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin:   EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(25.0),child: Image.asset(itemData["image"])),
              Positioned(
                  top: 15, right: 15,
                  child: BorderBox(
                width: 50,
                height: 50,
                child: Icon(Icons.favorite_border, color: COLOR_BLACK,),
              ))
            ],
          ),addVerticalSpace(15),
          Row(
            children: [
              Text("${itemData["amount"]}",
                style: themeData.textTheme.headline1,

              ),
              addHorizontalSpace(10),
              Text("${itemData["address"]}",
                style: themeData.textTheme.bodyText2,

              )
              ],
            ),
            addVerticalSpace(10),
            Text("${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathroo ms / ${itemData["area"]}",
              style: themeData.textTheme.headline5,

          )
        ],
      ),
    );

  }
}
