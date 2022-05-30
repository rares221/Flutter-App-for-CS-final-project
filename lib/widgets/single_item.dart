import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:licenta_2022_vr/config/colors.dart';
import 'package:provider/provider.dart';
import '../providers/review_cart_provider.dart';
import 'count.dart';
class SingleItem extends StatefulWidget {
  bool validator = false;
  String productImage;
  String productName;
  bool wishListCheck = false;
  int productPrice;
  String productId;
  int productQuantity;
  Function onDelete;
  var productUnit;
  SingleItem(
      {this.productQuantity,
        this.productId,
        this.productUnit,
        this.onDelete,
        this.validator,
        this.productImage,
        this.productName,
        this.productPrice,
        this.wishListCheck,});

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider reviewCartProvider;

  int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.validator == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "${widget.productPrice}\ lei",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      widget.validator == false
                          ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: new Text('250 grame'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: new Text('500 grame'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: new Text('1 Kg'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50 grame",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          : Text("Gramajele produselor pot diferi")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.validator == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.validator == false
                      ? Count(
                    productId: widget.productId,
                    productImage: widget.productImage,
                    productName: widget.productName,
                    productPrice: widget.productPrice,
                  )
                      : Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: widget.onDelete,
                          child: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        widget.wishListCheck == false
                            ? Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (count == 1) {
                                      Fluttertoast.showToast(
                                        msg:
                                        "Ati atins limita minima",

                                      );
                                    } else {
                                      setState(() {
                                        count--;
                                      });
                                      reviewCartProvider.updateReviewCartData(
                                        cartImage: widget.productImage,
                                        cartId: widget.productId,
                                        cartName: widget.productName,
                                        cartPrice: widget.productPrice,
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "$count",
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (count < 10) {
                                      setState(() {
                                        count++;
                                      });
                                      reviewCartProvider.updateReviewCartData(
                                        cartImage: widget.productImage,
                                        cartId: widget.productId,
                                        cartName: widget.productName,
                                        cartPrice: widget.productPrice,
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.validator == false
            ? Container()
            : Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}