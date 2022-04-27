import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopplift/main.dart';
import 'package:shopplift/utils/cart.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class CheckOutScreen extends StatefulWidget {
  static String id = 'CheckOutScreen';
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  static final String tokenizationKey = 'sandbox_fwpsfwcb_y84k2fxn4r76tv8y';
  bool active = false;

  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Payment method nonce:',
          style: TextStyle(color: Colors.black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Nonce: ${nonce.nonce}',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Type label: ${nonce.typeLabel}',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Description: ${nonce.description}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double total = Provider.of<CartData>(context).getTotal() * 0.05 +
        Provider.of<CartData>(context).getTotal();
    final s = MediaQuery.of(context).size;
    final h = s.height;
    final w = s.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: h,
          margin: EdgeInsets.only(
            top: 10,
            left: SizeConfig.sW! * 3,
            right: SizeConfig.sW! * 3,
            bottom: SizeConfig.sH! * 2,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.sW! * 1,
                      right: SizeConfig.sW! * 1,
                    ),
                    child: Center(
                      child: Text(
                        "Payment Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.sW! * 1,
                        bottom: SizeConfig.sH! * 1,
                        top: 10,),
                    child: Text(
                      "Complete your purchase by providing your payment details",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  HeadlineText(
                    w: w,
                    text: "Email Address",
                  ),
                  RoundedRectTextField(
                    height: SizeConfig.sH!,
                    hintText: "someone@gmail.com",
                    withHint: true,
                    borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                    textInputType: TextInputType.emailAddress,
                    onTap: () {
                      setState(() {
                        if (active == false) {
                          active = true;
                        } else
                          active = false;
                      });
                    },
                    onchanged: (value) {},
                  ),
                  HeadlineText(
                    w: w,
                    text: "Home Address",
                  ),
                  RoundedRectTextField(
                    height: 40,
                    hintText: "Address",
                    withHint: true,
                    borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                    textInputType: TextInputType.emailAddress,
                    onTap: () {
                      setState(() {
                        if (active == false) {
                          active = true;
                        } else
                          active = false;
                      });
                    },
                    onchanged: (value) {},
                  ),
                  HeadlineText(
                    w: w,
                    text: "Mobile Number",
                  ),
                  RoundedRectTextField(
                    height: h / 18,
                    hintText: "Mobile Number",
                    withHint: true,
                    borderColor: (active) ? Colors.blue.shade900 : Colors.grey,
                    textInputType: TextInputType.number,
                    onTap: () {
                      setState(() {
                        if (active == false) {
                          active = true;
                        } else
                          active = false;
                      });
                    },
                    onchanged: (value) {},
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.sH! * 1,
                              top: 10,
                            ),
                            child: Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "₦${Provider.of<CartData>(context).getTotal()}",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.sH! * 1, top: 10),
                            child: Text(
                              "VAT(5%)",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              "₦${Provider.of<CartData>(context).getTotal() * 0.05}",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.sH! * 1, top: 10, bottom: 10),
                            child: Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "₦$total",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: MaterialButton(
                  height: SizeConfig.sH! * 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h / 30),
                  ),
                  minWidth: w,
                  color: primary,
                  onPressed: () async {
                    var request = BraintreeDropInRequest(
                      tokenizationKey: tokenizationKey,
                      collectDeviceData: true,
                      googlePaymentRequest: BraintreeGooglePaymentRequest(
                        totalPrice: '$total',
                        currencyCode: 'USD',
                        billingAddressRequired: false,
                      ),
                      paypalRequest: BraintreePayPalRequest(
                        amount: '$total',
                        displayName: 'Marty',
                      ),
                      cardEnabled: true,
                    );
                    final result = await BraintreeDropIn.start(request);
                    if (result != null) {
                      showNonce(result.paymentMethodNonce);
                      showInSnackBar("Payment Complete", context);
                    }
                  },
                  child: Text(
                    "Pay ₦$total",
                    style: TextStyle(
                        fontSize: SizeConfig.sW! * 4, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.sW! * 1,
                  right: SizeConfig.sW! * 1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.grey,
                      size: w / 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payments are secure and encrypted",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
