import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/arrow-left.png"),
                          const SizedBox(width: 12),
                          const Text(
                            "Checkout",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff4d1a53),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                          color: Color(0xff1d1d1d), fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Image.asset("assets/images/circleavatar.png"),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Alireza",
                            style: TextStyle(color: Color(0xff1d1d1d)),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset("assets/images/sms.png"),
                              const SizedBox(width: 4),
                              const Text(
                                "CollenEd5237@gmail.com",
                                style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset("assets/images/call-calling.png"),
                              const SizedBox(width: 4),
                              const Text(
                                "+1 555 086 0012",
                                style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                            color: Color(0xff1d1d1d), fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(
                            color: Color(0xff4d1a53), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const AddressWidget(
                    location: "Home",
                    number: "+1 555 086 0012",
                    address: "2630 Wheeler Bridge",
                  ),
                  const SizedBox(height: 12),
                  const AddressWidget(
                    location: "Work",
                    number: "+1 555 086 0012",
                    address: "2630 Wheeler Bridge",
                  ),
                  const SizedBox(height: 12),
                  const AddressWidget(
                    location: "Office",
                    number: "+1 555 086 0012",
                    address: "2630 Wheeler Bridge",
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                        color: Color(0xff1d1d1d), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const PaymentWidget(
                    image: "assets/images/debitcard.png",
                    paymentmethod: "Debit/Credit Card",
                    mark: "assets/images/round.png",
                  ),
                  const SizedBox(height: 12),
                  const PaymentWidget(
                    image: "assets/images/netbanking.png",
                    paymentmethod: "Net Banking",
                    mark: "assets/images/round.png",
                  ),
                   const SizedBox(height: 12),
                  const PaymentWidget(
                    image: "assets/images/cod.png",
                    paymentmethod: "Cash On Delivery",
                    mark: "assets/images/round.png",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  final String image;
  final String paymentmethod;
  final String mark;
  const PaymentWidget({
    Key? key,
    required this.image,
    required this.paymentmethod,
    required this.mark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff7f8fa),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(image),
              Text(paymentmethod),
              Image.asset(mark),
            ],
          )
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  final String location;
  final String number;
  final String address;
  const AddressWidget({
    Key? key,
    required this.location,
    required this.number,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff7f8fa),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/round.png"),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(color: Color(0xff1d1d1d)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    number,
                    style: const TextStyle(
                        color: Color(0xff898989),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(address,
                      style: const TextStyle(
                        color: Color(0xff898989),
                        fontSize: 12,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}