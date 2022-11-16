import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rojmel/khataBook/controller/prodController.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  ProdController product_controller = Get.put(ProdController());

  Mydb db = Mydb();

  void getData() async {
    product_controller.Prodlist.value =
        await db.ProductFilterreaddata(product_controller.FilterDate.value);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          primary: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade900),
          ),
          elevation: 00,
          title: Text('Calender'),
          actions: [Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){datepick();}, icon: Icon(Icons.calendar_month_outlined)),
          )],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Date/Time",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Remark",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "You Gave | You Got",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: product_controller.Prodlist.length,
                  itemBuilder: (context, index) {
                    return product_controller.Prodlist[index]['payment_status']==1?Container():Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.grey.shade900,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 110,
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${product_controller.Prodlist[index]['purchase_date']}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${product_controller.Prodlist[index]['quantity']}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${product_controller.Prodlist[index]['product_name']}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    color: Colors.red,
                                    child: product_controller.Prodlist[index]
                                                ['payment_status'] ==
                                            0
                                        ? Text(
                                            "${product_controller.Prodlist[index]['price']}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : Text(""),
                                  ),
                                  Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    color: Colors.green,
                                    child: product_controller.Prodlist[index]
                                                ['payment_status'] ==
                                            1
                                        ? Text(
                                            "${product_controller.Prodlist[index]['price']}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : Text(""),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //get today's date
      firstDate: DateTime(2020),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2999),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade900, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {});
    } else {
      print("Date is not selected");
    }
  }
}
