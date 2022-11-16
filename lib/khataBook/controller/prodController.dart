import 'package:get/get.dart';
import 'package:rojmel/khataBook/controller/homeController.dart';
import 'package:rojmel/khataBook/modal/prodModal.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';

class ProdController extends GetxController
{
  RxList<Map> Prodlist = <Map>[].obs;
  RxList<Map> Prodlist2 = <Map>[].obs;
  RxString utxtRadio= "Done".obs;
  HomeController _controller = Get.put(HomeController());

  ProdModal? prodModal;

  RxInt mainpandingSum = 0.obs;
  RxInt maindoneSum = 0.obs;
  RxInt pandingSum =0.obs;
  RxInt doneSum = 0.obs;
  RxInt price = 0.obs;

  RxString FilterDate = "".obs;

  var Date = DateTime.now();

  void getData(dynamic date1)
  {
    Date = date1;

  }

  void division(){
    int i= 0;
    price.value=0;
    for(i=0;i<Prodlist.length;i++)
    {
      price.value=int.parse(Prodlist[i]['price']) + int.parse(Prodlist[i]['quantity']);
    }
  }
  void addition(){
    int i= 0;
    doneSum.value=0;
    pandingSum.value=0;
    for(i=0;i<Prodlist.length;i++)
    {
      Prodlist[i]['payment_status']==1?
      doneSum.value = int.parse(Prodlist[i]['price']) + doneSum.value:
      pandingSum.value=int.parse(Prodlist[i]['price']) + pandingSum.value;
    }
  }

  void topaddition() async{
    Mydb db = Mydb();
    Prodlist2.value = await db.ProreadData();

    int v = 0;
    mainpandingSum.value=0;
    maindoneSum.value=0;

    for(v=0;v<Prodlist2.length;v++){
      Prodlist2[v]['payment_status'] == 1?
      maindoneSum.value =  int.parse(Prodlist2[v]['price']) + maindoneSum.value :
      mainpandingSum.value =  int.parse(Prodlist2[v]['price']) + mainpandingSum.value;
    }
  }
  ProdModal ? Datapick2;
}