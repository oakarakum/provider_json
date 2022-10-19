// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_json/item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, Item item, widget) {
      return Scaffold(
          appBar:
              AppBar(title: Text("Sepetteki Ürün | ${item.basket!.length} | ")),
          body: Stack(
            children: [
              item.basket!.isEmpty
                  ? Center(
                      child: Text(
                      "Sepetiniz Boş",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 31,
                          fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemCount: item.basket!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100.w,
                          height: 8.h,
                          margin: EdgeInsets.only(bottom: 1.h),
                          padding: EdgeInsets.only(right: 3.w, left: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(4.w),
                                      child: SizedBox(
                                        width: 7.h,
                                        height: 7.h,
                                        child: Image.network(
                                            "${item.basket![index]["image"]}"),
                                      )),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "${item.basket![index]["title"]}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  item.removeBasket(index);
                                },
                                child: Container(
                                  width: 4.h,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(.7.h)),
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
              Positioned(
                  bottom: 2.h,
                  child: Container(
                    width: 92.w,
                    height: 8.h,
                    padding: EdgeInsets.only(left: 4.w),
                    child: Row(
                      children: [
                        Text(
                          "Ürün Fiyat Toplamı : ${item.price}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 4.w, right: 4.w),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2.w)),
                  )),
            ],
          ));
    }));
  }
}
/*
Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                item.reset();
              },
              child: Center(
                child: Container(
                  height: 12.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.amber),
                  child: Center(
                      child: Text(
                    "Clean shoplist",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 81, 131, 172),
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
*/