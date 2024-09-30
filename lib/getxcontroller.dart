import 'package:cart/clasz.dart';
import 'package:get/get.dart';
  import 'dart:convert';
import 'package:http/http.dart' as http;

class XC extends GetxController{

Future<void> fetchData() async {
  try {
    final response = await http.get(
      Uri.parse('https://admin.laborhut.org/api/v1/provider/adjustandpay'),
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWZhYWFjNi1jMWQyLTRkNGMtYmViMS0wNDE5NmRkMmZhOGUiLCJqdGkiOiI1NjY2MTQ5MDY1M2JhYWJhNGQ2NDM3OTAzNjAwMTI0ZWIwMzViY2JlZTZiOWJmNjUzODM3MTY1NTZiMWFiNjM5NmEwYWY2ZWMwYTBhMzM3NSIsImlhdCI6MTcyNjcxNDc4OC40NzkwOTkwMzUyNjMwNjE1MjM0Mzc1LCJuYmYiOjE3MjY3MTQ3ODguNDc5MTA0MDQyMDUzMjIyNjU2MjUsImV4cCI6MTc1ODI1MDc4OC40NTEzOTkwODc5MDU4ODM3ODkwNjI1LCJzdWIiOiJlNzQ2OGVkZi0yZjg5LTRiYTQtODVkMy1jZWRkMmZkZDhhOWMiLCJzY29wZXMiOltdfQ.eUWI8sxxHq5MwC5-vjvMmymZ-mfTL-Tc-tRiJOutabk7lbfyoJhEQPrZiqN-a4631EWdPOhz4AaZ8r_sY7cEfck_2hhv43HBTnbt9VAI86G0w4WmNTl8dCK4Z7UTqmebqjFY4jLIk5d5SogtEs225mD1K1ipwqGJTyRQ25mtT9sZqd4i9bO5Bu2_lMxJYZPTe3jk4JgIDX-CoHANBIPxp8O0m9B1LSL0QplvV0F2eEtgAZRCsrJci3xwIPWcMVAL8RrIwc9unhmjzs9zI0zanoJBWsuKBQtHjSpnrONyUtzDD2Ruz5RgsHmIo8GCfMw39R_3zfcPLYnK2_T_vesfSBOYKOJOd5Vw2sbbiGv0sqxaronxuv0wigJzH1SnahSLTyixXuQLCYvhfEnLgo42Gx4ovYpBewfXQrZXN2UvaadhAtZ0ykTVRbgpFrUaQm30gn9HdSscZK6xBndJEvqKUimfYDTHyC8n6hPD-h_yihcUJt0_3SuKbPpmT7_MKtpQxwB1JiUg-c7PTtpsNajEj3OEzNa_ajHL4E8YQKdfjKgeOZ5ASwM3',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Response data: ${response.body}');
    } else {
      // Log error details
      print('Error: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

   List<Cart> xc=[
    Cart(name: "Fucking", price: 300, discount: 0, quantity: 1),
      Cart(name: "Fucking1", price: 900, discount:0 , quantity: 1),
        Cart(name: "Fuckin5", price: 50, discount: 0, quantity: 3)
  ]; 

double? _totla=0;
double discount=0;
double? get totoalprice =>_totla;
  totalprice(){
    _totla=0;
    for (var data in xc){
      if(data.quantity!>0){
       _totla =_totla!+(data.quantity!*data.price!.toInt());
      }
    }
    discouned();
  }
  discouned(){
    discount=0;
    for(var dx in xc){
      if(dx.discount!>0){
   discount=discount+(dx.discount!*dx.quantity!.toInt());
      }

    }
  }



  increasequnatity(int index){
    xc[index].quantity=(xc[index].quantity!+1)!;
//   int cv= cart.quantity!+1;
 update();
   totalprice();
   discouned();
  }
}