import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterMenu extends StatelessWidget {
  FilterMenu({Key? key}) : super(key: key);
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: getProportionateScreenHeight(100),
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  color: Colors.grey.withOpacity(0.5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                      child: Text("Search Filter",style: TextStyle(fontSize: getProportionateScreenWidth(15)),)),
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Text("Rating",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectRating.value = 1;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectRating.value == 1?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectRating.value == 1?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(child: Text("5 Stars"),),
                              ),),
                            )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  _categoryController.selectRating.value = 2;
                                },
                                child: Obx(()=>Container(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _categoryController.selectRating.value == 2?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                    color: _categoryController.selectRating.value == 2?Colors.transparent:Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(child: Text("4 Stars & Up"),),
                                ),),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  _categoryController.selectRating.value = 3;
                                },
                                child: Obx(()=>Container(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _categoryController.selectRating.value == 3?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                    color: _categoryController.selectRating.value == 3?Colors.transparent:Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(child: Text("3 Stars & Up"),),
                                ),),
                              )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  _categoryController.selectRating.value = 4;
                                },
                                child: Obx(()=>Container(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _categoryController.selectRating.value == 4?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                    color: _categoryController.selectRating.value == 4?Colors.transparent:Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(child: Text("2 Stars & Up"),),
                                ),),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                                onTap: (){
                                  _categoryController.selectRating.value = 5;
                                },
                                child: Obx(()=>Container(
                                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _categoryController.selectRating.value == 5?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                    color: _categoryController.selectRating.value == 5?Colors.transparent:Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(child: Text("1 Stars & Up"),),
                                ),),
                              )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                            child: SizedBox()
                          )
                        ],
                      ),
                      Divider(color: Colors.black45,),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Text("Price Range",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
                      SizedBox(height: getProportionateScreenHeight(15),),
                      Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        color: Colors.grey.withOpacity(0.3),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Container(
                              height: getProportionateScreenHeight(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.withOpacity(0.8))
                              ),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12)
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "MIN",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none
                                  ),
                                ),
                              ),
                            )),
                            SizedBox(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                child: Text("-"),
                              ),
                            ),
                            Expanded(child: Container(
                              height: getProportionateScreenHeight(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.withOpacity(0.8))
                              ),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12)
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    hintText: "MAX",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Text("Discount",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
                      SizedBox(height: getProportionateScreenHeight(15),),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectDiscount.value = 1;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectDiscount.value == 1?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectDiscount.value == 1?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(child: Text("Discount"),),
                              ),),
                            )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectDiscount.value = 2;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectDiscount.value == 2?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectDiscount.value == 2?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Discount",style: TextStyle(overflow: TextOverflow.ellipsis),),
                                    Icon(Icons.height,color: Colors.black.withOpacity(0.7),size: getProportionateScreenWidth(15),)
                                  ],
                                ),
                              ),),
                            )
                          )
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Text("Brand",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
                      SizedBox(height: getProportionateScreenHeight(15),),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectBrand.value = 1;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectBrand.value == 1?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectBrand.value == 1?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child: Text("The Face Shop",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                              ),),
                            )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectBrand.value = 2;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectBrand.value == 2?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectBrand.value == 2?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child: Text("Beaute",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                              ),),
                            )
                          )
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _categoryController.selectBrand.value = 3;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectBrand.value == 3?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectBrand.value == 3?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child: Text("SKINFOOD",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                              ),),
                            )
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(
                            child:InkWell(
                              onTap: (){
                                _categoryController.selectBrand.value = 4;
                              },
                              child: Obx(()=>Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _categoryController.selectBrand.value == 4?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                  color: _categoryController.selectBrand.value == 4 ?Colors.transparent:Colors.grey.withOpacity(0.3),
                                ),
                                child: const Center(child: Text("Nella",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                              ),),
                            )
                          )
                        ],
                      ),
                      Obx((){
                        if(_categoryController.isShowAllBrand.value){
                          return Column(
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 5;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 5?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 5?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("RiRe",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 6;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 6?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 6?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("Purito",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 7;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 7?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 7?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("beauty of jeoson",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 8;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 8?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 8?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("farm stay",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 9;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 9?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 9?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("Mise en Scene",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 10;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 10?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 10?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("3w clinic",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 11;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 11?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 11?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("innisfree",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 12;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 12?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 12?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("COS DE BAHA",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 13;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 13?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 13?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("SOME BY MI",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 14;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 14?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 14?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("ETUDE HOUSE",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 15;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 15?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 15?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("C O S R X",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        _categoryController.selectBrand.value = 16;
                                      },
                                      child: Obx(()=>Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: _categoryController.selectBrand.value == 16?AllColors.mainColor:Colors.grey.withOpacity(0.3)),
                                          color: _categoryController.selectBrand.value == 16?Colors.transparent:Colors.grey.withOpacity(0.3),
                                        ),
                                        child: const Center(child: Text("HTS",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                                      ),),
                                    )
                                  )
                                ],
                              ),
                            ],
                          );
                        }else{
                          return SizedBox();
                        }
                      }),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Center(
                        child: Obx(()=>_categoryController.isShowAllBrand.value?TextButton.icon(onPressed: (){_categoryController.isShowAllBrand.value = false;}, icon: Icon(Icons.keyboard_arrow_up), label: Text("Show Less")):TextButton.icon(onPressed: (){
                          _categoryController.isShowAllBrand.value = true;
                        }, icon: Icon(Icons.keyboard_arrow_down), label: Text("Show More"))),
                      )

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(child: InkWell(
                onTap: (){
                  _categoryController.selectRating.value = 10;
                  _categoryController.selectDiscount.value = 10;
                  _categoryController.selectBrand.value = 100;
                  _categoryController.isShowAllBrand.value = false;
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    border: Border.all(color: AllColors.mainColor)
                  ),
                  child: Center(child: Text("Reset",style: TextStyle(color: AllColors.mainColor,fontSize: getProportionateScreenWidth(15)),)),
                ),
              )),
              SizedBox(width: getProportionateScreenWidth(10),),
              Expanded(child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                    color: AllColors.mainColor
                ),
                child: Center(child: Text("Apply",style: TextStyle(color: Colors.white,fontSize: getProportionateScreenWidth(15)),)),
              )),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10),)
      ],
    );
  }
}
