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
        appBar: AppBar(
          title: Text("Sepetteki Ürün | ${item.basket!.length} |"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(),
                    ));
              },
              child: Container(
                width: 5.h,
                margin: EdgeInsets.only(
                    left: 3.w, right: 3.w, top: 2.w, bottom: 2.w),
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.green,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w)),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
              width: 100.w,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 15),
                  itemCount: item.productList!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 15.h,
                      width: 100.w,
                      margin: EdgeInsets.only(bottom: 1.h),
                      padding: EdgeInsets.only(right: 3.w, left: 3.w),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 10, 91, 131)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                                height: 10.h,
                                width: 7.5.h,
                                child: Image.network(
                                  "${item.productList![index]["image"]}",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(
                            width: 39.w,
                            child: Column(
                              children: [
                                SizedBox(height: 8.w),
                                Text(
                                  "${item.productList![index]["title"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Text("${item.productList![index]["color"]}",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "${item.productList![index]["price"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              item.addBasket(item.productList![index]);
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
          ],
        ),
      );
    }));
  }
}
