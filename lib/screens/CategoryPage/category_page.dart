import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/components/AllProduct.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Row(
        children: <Widget>[
          Obx(()=>NavigationRail(
            backgroundColor: Colors.grey.withOpacity(0.1),
            selectedIndex: _categoryController.selectedTab.value,
            onDestinationSelected: (int index) {
              _categoryController.selectedTab.value = index;
              _categoryController.getSubCategoryList(type: index);
            },
            selectedIconTheme: IconThemeData(color: AllColors.mainColor),
            selectedLabelTextStyle: TextStyle(
              color: AllColors.mainColor
            ),
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Image.asset("asset/images/category/skin_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),),
                selectedIcon: Image.asset("asset/images/category/skin_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),fit: BoxFit.contain,color: Colors.black,),
                label: Text('SKIN CARE',style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
              ),
              NavigationRailDestination(
                icon: Image.asset("asset/images/category/body_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),),
                selectedIcon: Image.asset("asset/images/category/body_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),fit: BoxFit.contain,color: Colors.black,),
                label: Text('BODY CARE',style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
              ),
              NavigationRailDestination(
                icon: Image.asset("asset/images/category/hair_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),),
                selectedIcon: Image.asset("asset/images/category/hair_care.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),fit: BoxFit.contain,color: Colors.black,),
                label: Text('HAIR CARE',style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
              ),
              NavigationRailDestination(
                icon: Image.asset("asset/images/category/makeup.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),),
                selectedIcon: Image.asset("asset/images/category/makeup.png",height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),fit: BoxFit.contain,color: Colors.black,),
                label: Text('MAKE UP',style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
              ),
            ],
          ),),
          Expanded(
            child: Obx((){
              switch(_categoryController.selectedTab.value){
                case 0:
                  return gridView(list: _categoryController.skinCareList);
                case 1:
                  return gridView(list: _categoryController.bodyCareList);
                case 2:
                  return gridView(list: _categoryController.hairCareList);
                case 3:
                  return gridView(list: _categoryController.makeupCareList);
                default:
                  return gridView(list: _categoryController.skinCareList);
              }
            })
          )
        ],
      ),
    );

  }

  Widget gridView({required var list}){
    return GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3
        ), itemBuilder: (context , index){
          CategoryModel result = list[index];
      return Padding(
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>AllProduct(type: result.title,)));
          },
          title: Image.asset(result.icon,height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(40),),
          subtitle: Text(result.title,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(13)),),
        ),
      );
    });
  }
}
