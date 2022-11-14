import 'package:get/get.dart';
import 'package:rojmel/khataBook/modal/prodModal.dart';

class ProdController extends GetxController
{
  RxList<Map> Prodlist = <Map>[].obs;
  RxString utxtRadio= "Done".obs;

  ProdModal? prodModal;
}