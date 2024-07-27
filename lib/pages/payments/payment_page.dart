// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:copy_of_margdrashak/my%20widgets/hidden_drawer.dart';
import 'package:copy_of_margdrashak/my%20widgets/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:copy_of_margdrashak/my%20widgets/my_button.dart';
import 'package:lottie/lottie.dart';

class PaymentPage extends StatefulWidget {
  String amount;
  PaymentPage({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String card_number = '';
  String expiry = '';
  String cvv = '';
  String card_holder_name = '';
  bool iscvvfocused = false;

  Future<void> show_animation_navigate() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/61d7fdd4-c9c1-497a-a3a9-d1317f17e306/YRUAMEzLDh.json',
              ),
              Text(
                'PROCESSING PAYMENT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
    await Future.delayed(Duration(seconds: 6));
    Navigator.of(context).pop();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
      builder: (context) => HiddenDrawer(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAYMENT PAGE'),
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: card_number,
                expiryDate: expiry,
                cardHolderName: card_holder_name,
                cvvCode: cvv,
                showBackView: iscvvfocused,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
              CreditCardForm(
                cardNumber: card_number,
                expiryDate: expiry,
                cardHolderName: card_holder_name,
                cvvCode: cvv,
                onCreditCardModelChange: (data) {
                  setState(() {
                    card_number = data.cardNumber;
                    cvv = data.cvvCode;
                    expiry = data.expiryDate;
                    card_holder_name = data.cardHolderName;
                    iscvvfocused = data.isCvvFocused;
                  });
                },
                formKey: formkey,
              ),
              SizedBox(
                height: 10,
              ),
              my_button(
                  text: 'PROCEED TO PAY ${widget.amount}/-',
                  ontap: () async {
                    if (card_holder_name != null &&
                        card_holder_name.isNotEmpty &&
                        card_number != null &&
                        card_number.isNotEmpty &&
                        cvv.isNotEmpty &&
                        cvv != null &&
                        expiry != null &&
                        expiry.isNotEmpty) {
                      await show_animation_navigate();
                    } else {
                      dialog(context, 'please fill all the details');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
