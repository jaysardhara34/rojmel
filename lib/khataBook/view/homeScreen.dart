import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rojmel/khataBook/controller/homeController.dart';
import 'package:rojmel/khataBook/modal/homeModal.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';
import 'package:rojmel/khataBook/view/customerScreen.dart';
import 'package:rojmel/khataBook/view/screens/calender.dart';
import 'package:rojmel/khataBook/view/screens/historyScreen.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtmobile = TextEditingController();
  TextEditingController _txtadd = TextEditingController();
  TextEditingController _utxtname = TextEditingController();
  TextEditingController _utxtmobile = TextEditingController();
  TextEditingController _utxtadd = TextEditingController();

  Mydb _db = Mydb();
  HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    _controller.Cuslist.value = await _db.readData();
    print(_controller.Cuslist);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          leading: Icon(Icons.menu_outlined),
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
          title: Text('Rojmel'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Get.to(Calender());
                  },
                  icon: Text(
                    '🗓️',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.defaultDialog(
              content: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _txtname,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff919191),
                        ),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _txtmobile,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(width: 53,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  color: Color(0xff919191),
                                ),
                                Text('+91',style: TextStyle(color: Color(0xff919191),),),
                              ],
                            ),
                          ),
                        ),
                        focusColor: Color(0xff000000),
                        fillColor: Color(0xff000000),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Mobile',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _txtadd,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color: Color(0xff919191),
                        ),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      _txtmobile.clear();
                      _txtname.clear();
                      _txtadd.clear();
                      Get.back();
                    },
                    child: Text(
                      'Cancle',
                      style: TextStyle(color: Color(0xff000000), fontSize: 15),
                    )),
                SizedBox(
                  width: 1,
                ),
                TextButton(
                    onPressed: () {
                      _db.insertData(
                          _txtname.text, _txtmobile.text, _txtadd.text);
                      getdata();
                      _txtname.clear();
                      _txtmobile.clear();
                      _txtadd.clear();
                      Get.back();
                      Get.snackbar('Customer Data', 'Added Sucessfully',
                          duration: Duration(seconds: 1));
                    },
                    child: Text('Add',
                        style: TextStyle(color: Colors.blue, fontSize: 16)))
              ],
              titleStyle: TextStyle(color: Color(0xff000000)),
              backgroundColor: Color(0xfffafafa),
              title: 'Add New Customer',
            );
          },
          backgroundColor: Colors.blue.shade900,
          label: Row(
            children: [
              Icon(Icons.add),
              SizedBox(
                width: 5,
              ),
              Text(
                'Add New Customer',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Payment done',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.042),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '₹ 0',
                                style: TextStyle(
                                    color: Color(0xff44b718),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08),
                              ),
                            ],
                          ),
                          Container(
                            child: Text('|',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    color: Color(0xffbdbdbd))),
                          ),
                          Column(
                            children: [
                              Text(
                                'Payment Remian',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.042),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '₹ 0',
                                style: TextStyle(
                                    color: Color(0xffd01717),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Color(0xffbdbdbd),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Get.to(HistoryScreen());
                            },
                            child: Text(
                              'View History >',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _controller.dataModal = DataModal(
                            id: _controller.Cuslist.value[index]['id']
                                .toString(),
                            name: _controller.Cuslist.value[index]['name'],
                            address: _controller.Cuslist.value[index]
                                ['address'],
                            mobile: _controller.Cuslist.value[index]['mobile']);
                        Get.to(CustomerInfo());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 13, right: 7, left: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffe5e5e5),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage('assets/1.png'),
                              radius: 30),
                          title: Text(
                            '${_controller.Cuslist.value[index]['name']}',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          subtitle: Text(
                            '${_controller.Cuslist.value[index]['address']}',
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () {
                                    _utxtmobile = TextEditingController(
                                        text:
                                            '${_controller.Cuslist.value[index]['mobile']}');
                                    _utxtname = TextEditingController(
                                        text:
                                            '${_controller.Cuslist.value[index]['name']}');
                                    _utxtadd = TextEditingController(
                                        text:
                                            '${_controller.Cuslist.value[index]['address']}');
                                    Get.defaultDialog(
                                      content: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              controller: _utxtname,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.person,
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
                                                hintText: 'Enter Name',
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
                                              controller: _utxtmobile,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.phone_android,
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
                                                hintText: 'Enter Mobile',
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
                                              controller: _utxtadd,
                                              cursorColor: Color(0xff000000),
                                              style: TextStyle(
                                                  color: Color(0xff000000)),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.home,
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
                                                hintText: 'Enter Address',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff000000)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              _utxtmobile.clear();
                                              _utxtname.clear();
                                              _utxtadd.clear();
                                              Get.back();
                                            },
                                            child: Text(
                                              'Cancle',
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 15),
                                            )),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              _db.updateData(
                                                  _utxtname.text,
                                                  _utxtmobile.text,
                                                  _utxtadd.text,
                                                  '${_controller.Cuslist.value[index]['id']}');
                                              getdata();
                                              Get.back();
                                              Get.snackbar('Customer Data',
                                                  'Updated Sucessfully',
                                                  duration:
                                                      Duration(seconds: 1));
                                            },
                                            child: Text('Update',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16)))
                                      ],
                                      titleStyle:
                                          TextStyle(color: Color(0xff000000)),
                                      backgroundColor: Color(0xfffafafa),
                                      title: 'Update Customer',
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Edit',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  _db.deleteData(
                                      '${_controller.Cuslist.value[index]['id']}');
                                  getdata();
                                  Get.snackbar(
                                      'Customer Data', 'Deleted Sucessfully',
                                      duration: Duration(seconds: 1));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: _controller.Cuslist.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
