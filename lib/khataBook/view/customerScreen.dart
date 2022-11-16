import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:rojmel/khataBook/controller/homeController.dart';
import 'package:rojmel/khataBook/controller/prodController.dart';
import 'package:rojmel/khataBook/modal/prodModal.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';
import 'package:rojmel/khataBook/view/addproductScreen/payLater.dart';
import 'package:rojmel/khataBook/view/addproductScreen/payNow.dart';
import 'package:rojmel/khataBook/view/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtqa = TextEditingController();
  TextEditingController _txtprice = TextEditingController();
  TextEditingController _txtpurdate = TextEditingController();

  Mydb _db = Mydb();
  HomeController _controller = Get.put(HomeController());
  ProdController _pcontroller = Get.put(ProdController());

  @override
  void initState() {
    getdata();
    super.initState();
  }

  void getdata() async {
    _controller.Cuslist.value = await _db.readData();
    _pcontroller.Prodlist.value =
        await _db.ProreadData(id: _controller.dataModal!.id);
    _pcontroller.addition();
    _pcontroller.price();
    _pcontroller.topaddition();
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
          title: Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/1.png'),
                  radius: 17),
              SizedBox(
                width: 10,
              ),
              Text(
                '${_controller.dataModal!.name}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse("tel: +91${_controller.dataModal!.mobile}"));
                  },
                  icon: Icon(Icons.phone)),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Done',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.055),
                                  ),
                                  Obx(
                                    () => Text(
                                      '₹ ${_pcontroller.doneSum.value}',
                                      style: TextStyle(
                                          color: Color(0xff44b718),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.055),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Color(0xffbdbdbd),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Pending',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.055),
                                  ),
                                  Obx(
                                    () => Text(
                                      '₹ ${_pcontroller.pandingSum.value}',
                                      style: TextStyle(
                                          color: Color(0xffd01717),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.055),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(top: 6, left: 6, right: 6),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                          "sms: +91${_controller.dataModal!.mobile}"));
                                    },
                                    icon: Icon(
                                      Icons.message_outlined,
                                      color: Colors.blue.shade900,
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.currency_rupee,
                                      color: Colors.blue.shade900,
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async => await launch(
                                        "https://wa.me/+91${_controller.dataModal!.mobile}?text=Hello Mr .${_controller.dataModal!.name} from ${_controller.dataModal!.address} Your Date To Pay Your Bill is Here Please Kindly Pay As Soon As Possible"),
                                    icon: Icon(
                                      Icons.whatsapp,
                                      color: Colors.blue.shade900,
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.sticky_note_2_outlined,
                                      color: Colors.blue.shade900,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Date/Qa'),
                                ),
                                Text('Remark'),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Remain'),
                                Container(
                                  height: 15,
                                  width: 0.5,
                                  color: Colors.black,
                                ),
                                Text('Done')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => Expanded(
                        child: ListView.builder(
                          itemCount: _pcontroller.Prodlist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                _txtprice = TextEditingController(
                                    text:
                                        '${_pcontroller.Prodlist[index]['price']}');
                                _txtpurdate = TextEditingController(
                                    text:
                                        '${_pcontroller.Prodlist[index]['purchase_date']}');
                                _txtname = TextEditingController(
                                    text:
                                        '${_pcontroller.Prodlist[index]['product_name']}');
                                _txtqa = TextEditingController(
                                    text:
                                        '${_pcontroller.Prodlist[index]['quantity']}');
                                Get.defaultDialog(
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _db.Prodeletedata(_pcontroller
                                              .Prodlist.value[index]['id']
                                              .toString());
                                          getdata();
                                          Get.back();
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 15),
                                        )),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          _db.Proupdatedata(
                                              _pcontroller.Prodlist[index]['id']
                                                  .toString(),
                                              _txtname.text,
                                              _txtqa.text,
                                              _txtprice.text,
                                              _txtpurdate.text,
                                              _pcontroller.Prodlist[index]
                                                  ['client_id'],
                                              _pcontroller.utxtRadio.value ==
                                                      "Done"
                                                  ? 1
                                                  : 0);

                                          getdata();
                                          Get.back();
                                          Get.snackbar('Customer Data',
                                              'Updated Sucessfully',
                                              duration: Duration(seconds: 1));
                                        },
                                        child: Text('Update',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16)))
                                  ],
                                  title: 'Update Product Details',
                                  content: Expanded(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 30, left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: _txtname,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.propane_tank_outlined,
                                                  color: Color(0xff919191),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: Color(0xff919191)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintText: 'Enter Product Name',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              controller: _txtqa,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons
                                                      .production_quantity_limits,
                                                  color: Color(0xff919191),
                                                ),
                                                focusColor: Color(0xff000000),
                                                fillColor: Color(0xff000000),
                                                hintStyle: TextStyle(
                                                    color: Color(0xff919191)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintText: 'Enter Quantity',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              keyboardType: TextInputType
                                                  .numberWithOptions(),
                                              controller: _txtprice,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.currency_rupee,
                                                  color: Color(0xff919191),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: Color(0xff919191)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintText: 'Enter Price',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              readOnly: true,
                                              onTap: () {
                                                datepick();
                                              },
                                              controller: _txtpurdate,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.date_range_sharp,
                                                  color: Color(0xff919191),
                                                ),
                                                focusColor: Color(0xff000000),
                                                fillColor: Color(0xff000000),
                                                hintStyle: TextStyle(
                                                    color: Color(0xff919191)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                hintText: 'Enter Purchase Date',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child:
                                                    Text('Payment Status :')),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Obx(
                                              () => Column(
                                                children: [
                                                  RadioListTile(
                                                    activeColor:
                                                        Color(0xff000000),
                                                    value: "Done",
                                                    groupValue: _pcontroller
                                                        .utxtRadio.value,
                                                    onChanged: (value) {
                                                      _pcontroller
                                                              .utxtRadio.value =
                                                          value as String;
                                                    },
                                                    title: Text("Completed",
                                                        style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05)),
                                                  ),
                                                  RadioListTile(
                                                    activeColor:
                                                        Color(0xff000000),
                                                    value: "Remaind",
                                                    groupValue: _pcontroller
                                                        .utxtRadio.value,
                                                    onChanged: (value) {
                                                      _pcontroller
                                                              .utxtRadio.value =
                                                          value as String;
                                                    },
                                                    title: Text(
                                                      "Remain",
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.99,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 7),
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${_pcontroller.Prodlist[index]['purchase_date']}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04),
                                                ),
                                                Text(
                                                  "${_pcontroller.Prodlist[index]['quantity']}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "${_pcontroller.Prodlist[index]['product_name']}",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.045),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.19,
                                        color: Colors.red.shade200,
                                        child: Center(
                                          child: Obx(
                                            () => Text(
                                              "${_pcontroller.Prodlist[index]['payment_status'] == 1 ? '₹ 0' : '₹ ${_pcontroller.Prodlist[index]['price']}'}",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.047,
                                                  color: Colors.red.shade900),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.186,
                                        child: Center(
                                          child: Text(
                                            "${_pcontroller.Prodlist[index]['payment_status'] == 0 ? '₹ 0' : '₹ ${_pcontroller.Prodlist[index]['price']}'}",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.047,
                                                color: Colors.green.shade900),
                                          ),
                                        ),
                                      ),
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
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff44b718),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.40,
                                MediaQuery.of(context).size.height * 0.06)),
                        onPressed: () {
                          Get.off(PayNowScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                            Icon(Icons.currency_rupee)
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd01717),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.40,
                                MediaQuery.of(context).size.height * 0.06)),
                        onPressed: () {
                          Get.off(PayLaterScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pay Later',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                            Icon(Icons.currency_rupee)
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
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
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        _txtpurdate = TextEditingController(text: "$formattedDate");
      });
    } else {
      print("Date is not selected");
    }
  }
}
