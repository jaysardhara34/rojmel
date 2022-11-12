import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rojmel/khataBook/controller/homeController.dart';
import 'package:rojmel/khataBook/controller/prodController.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';
import 'package:rojmel/khataBook/view/addproductScreen/payLater.dart';
import 'package:rojmel/khataBook/view/addproductScreen/payNow.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
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
    _pcontroller.Prodlist.value = await _db.ProreadData(_controller.dataModal!.id!);
    print(_controller.Cuslist);
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
              child: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
            )
          ],
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Done',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
                                ),
                                Text(
                                  '₹ 0',
                                  style: TextStyle(
                                      color: Color(0xff44b718),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Pending',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
                                ),
                                Text(
                                  '₹ 0',
                                  style: TextStyle(
                                      color: Color(0xffd01717),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                              Text('Remind'),
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.99,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 7),
                                    height: 60,
                                    width: MediaQuery.of(context).size.width *
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
                                                "${_pcontroller.Prodlist[index]['purchasedate']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                                            Text(
                                              "${_pcontroller.Prodlist[index]['quantity']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),
                                            )
                                          ],
                                        ),
                                        Text("${_pcontroller.Prodlist[index]['productname']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    color: Colors.red.shade200,
                                    child: Center(
                                      child: Text("₹ ${_pcontroller.Prodlist[index]['price']}",
                                        style: TextStyle(color: Colors.red.shade900),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                                    height: 60,
                                    width: MediaQuery.of(context).size.width *
                                        0.186,
                                    child: Center(
                                      child: Text(
                                        "₹ ${_pcontroller.Prodlist[index]['price']}",
                                        style: TextStyle(color: Colors.green.shade900),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
