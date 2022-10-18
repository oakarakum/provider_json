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
        appBar: AppBar(title: Text("Sepetteki Ürün | ${item.cartCounts} | ")),
        body: Column(
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
      );
    }));
  }
}
