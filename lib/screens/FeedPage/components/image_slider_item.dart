import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ImageSliderItem extends StatefulWidget {
  ImageSliderItem({Key? key,required this.images}) : super(key: key);
  List<String> images;

  @override
  _ImageSliderItemState createState() => _ImageSliderItemState();
}

class _ImageSliderItemState extends State<ImageSliderItem> {

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: getProportionateScreenWidth(250),
        child: Stack(
          children: [
            CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.images[itemIndex]),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                options: CarouselOptions(
                  height: getProportionateScreenWidth(250),
                  aspectRatio: 16/9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  onPageChanged: (value,reason){
                    setState(() {
                      itemCount = value + 1;
                    });
                  },
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )
            ),
            Positioned(
              right: getProportionateScreenWidth(10),
              top: getProportionateScreenWidth(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5),vertical: getProportionateScreenWidth(2)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                    color: Colors.black.withOpacity(0.4)
                ),
                child: Text("${itemCount.toString()}/${widget.images.length}",style: TextStyle(color: Colors.white,fontSize: getProportionateScreenWidth(10)),),
              ),
            )
          ],
        )
    );
  }
}
