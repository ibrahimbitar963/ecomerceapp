import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constance.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontsize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(

                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(16),
                          //   width: MediaQuery.of(context).size.width * .4,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       border: Border.all(
                          //         color: Colors.grey,
                          //       )),
                          //   child: Row(
                          // //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       CustomText(
                          //         text: 'Size',
                          //       ),
                          //       CustomText(
                          //         text: model.sized,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(16),
                          //   width: MediaQuery.of(context).size.width * .44,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       border: Border.all(
                          //         color: Colors.grey,
                          //       )),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       CustomText(
                          //         text: 'Color',
                          //       ),
                          //       Container(
                          //         width: 30,
                          //         height: 20,
                          //         padding: EdgeInsets.all(12),
                          //         decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(20),
                          //           color: Colors.grey,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // CustomText(
                      //   text: 'Details',
                      //   fontsize: 18,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // CustomText(
                      //   text: model.description,
                      //   fontsize: 18,
                      //
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(

                        text: "PRICE ",
                        fontsize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: ' \$' + model.price,
                        color: PrimayColor,
                        fontsize: 18,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onpressed: () {},
                      text: 'Add',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}