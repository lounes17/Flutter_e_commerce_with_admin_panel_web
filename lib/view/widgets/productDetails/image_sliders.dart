import 'package:application_mobile/logic/controllers/cart_controller.dart';
import 'package:application_mobile/routes/routes.dart';
import 'package:application_mobile/utils/theme.dart';
import 'package:application_mobile/view/widgets/productDetails/color_picker.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget
{

  final String imageUrl;
  const ImageSliders (
      {
        required this.imageUrl,
        Key? key,
      }) : super(key: key);


  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders>
{
  final cartController = Get.find<CartController>();
  CarouselController carouselController = CarouselController();
  final List<Color> colorSelected =
  [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  int currentPage = 0;
  int currentColor = 0;

  
  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children:
      [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 3,
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason)
            {
              setState(()
              {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex)
          {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: mainColor,
              ),
            ),
        ),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index)
                  {
                    return GestureDetector(
                      onTap: ()
                      {
                        setState(()
                        {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          color: colorSelected[index],
                          outerBorder: currentColor == index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 3),
                  itemCount: colorSelected.length,
              ),
            ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              InkWell(
                onTap: ()
                {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),

                  ),
                ),
              ),
              Obx(()
              => Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: ()
                  {
                    Get.offNamed(Routes.cartScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.shopping_cart,size: 20,color: Colors.white,),
                  ),
                ),
              ),),
            ],
          ),
        ),


      ],
    );
  }
}
