import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/view/details_view.dart';
import 'package:e_commerce_app/view/view_auth/login_view.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder:(controller)=> controller.loading.value? Center(child: CircularProgressIndicator())
          : Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                _searchTextFormFiled(),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'Categories',
                ),
                SizedBox(
                  height: 30,
                ),
                _listViewCategory(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Selling',
                      fontsize: 18,
                    ),
                    CustomText(
                      text: 'See All',
                      fontsize: 16,
                    ),
                  //
                  ],

                ),
                SizedBox(height: 20,),
                _listViewProducts(),
              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _searchTextFormFiled() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade400,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder :(controller)=> Container(
        height: 100,
        child: ListView.separated(

          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categortyModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categortyModel[index].name,
                ),
              ],
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount:controller.categortyModel.length ,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30,
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(
        height: 300,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:(){
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              } ,
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      width: MediaQuery.of(context).size.width * .4,
                      child: Container(
                        height: 160,
                        child: Image.network(
                          controller.productModel[index].image,
              fit: BoxFit.fill,
              ),

                        ),
                      ),

                    SizedBox(height: 10,),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                   SizedBox(height: 10,),

                    Expanded(
                      child: CustomText(
                        color: Colors.grey,
                        text: controller.productModel[index].description,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(height: 10,),

                    CustomText(
                      text: controller.productModel[index].price.toString() +'\$',
                      color: PrimayColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30,
            );
          },
        ),
      ),
    );
  }


}
