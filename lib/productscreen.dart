import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_json/checkout.dart';
import 'package:provider_json/item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, Item item, widget) {
      return Scaffold(
        appBar: AppBar(title: Text(" Sepetteki ürünler ${item.cartCounts}")),
        body: Column(
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 60.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Container(
                        height: 8.h,
                        width: 100.w,
                        margin: EdgeInsets.only(bottom: 1.h),
                        padding: EdgeInsets.only(right: 3.w, left: 3.w),
                        decoration: BoxDecoration(color: Colors.blueGrey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ürün Listesi",
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                item.increase();
                              },
                              child: Container(
                                width: 4.h,
                                height: 7.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(.7.h),
                                ),
                                child: Icon(Icons.add_shopping_cart_outlined),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout()));
              },
              child: Container(
                width: 50.w,
                height: 8.h,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                    child: Text(
                  "Go to the cart",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
              ),
            )
          ],
        ),
      );
    }));
  }
}
