import 'package:cart/clasz.dart';
import 'package:cart/getxcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(Mas());
}

class Mas extends StatelessWidget {
  const Mas({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      initialBinding:BindingsBuilder((){
Get.put(XC());
  }) ,
      home:Data() ,
    );
  }
}


class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  void initState() {
    Get.find<XC>().fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 500,width: 300,
          child: GetBuilder<XC>(builder: (xsc){
              return ListView.builder(
                itemCount: xsc.xc.length,
                itemBuilder: (_,index){
          return ListTile(title: Text(xsc.xc[index].name.toString()),
          leading: IconButton(onPressed: (){
            Get.find<XC>().increasequnatity(index);
          }, icon: Icon(Icons.add)),
           subtitle: Column(
                children: [
                  Text("Price: ${xsc.xc[index].price.toString()}"),
                  Text("quantity:${xsc.xc[index].quantity}")
                ],
              ),
          );
              });
         
          }),
        ),
        GetBuilder<XC>(builder: (cv){
return Row(
  children: [
      Text("total: ${cv.totoalprice}"),
          Text("Discount: ${cv.discount}"),
          Text("After discount:${cv.totoalprice!-cv.discount}")
  ],
);
        })
      
      ],),
    );
  }
}


// class Data extends StatefulWidget {
//   const Data({super.key});

//   @override
//   State<Data> createState() => _DataState();
// }

// class _DataState extends State<Data> {
//   List<Cart> xc=[
//     Cart(name: "Fucking", price: 300, discount: 0, quantity: 1),
//       Cart(name: "Fucking1", price: 900, discount: 22, quantity: 1),
//         Cart(name: "Fuckin5", price: 50, discount: 12, quantity: 2)
//   ];
// int total=0;
// double disc=0;
//   @override
//   Widget build(BuildContext context) {
//     for(var data in xc){
//     int cb=  data.price!*data.quantity!.toInt();
//  total = total+ cb;
//     }
//        for(var data in xc){
// if(data.discount!>0){
//   double diwsc=data.discount!*data.quantity!.toInt();
//   disc+=diwsc;
// }
//     }
//     setState(() {
      
//     });
//     return Scaffold(
//       body: Flex(
//       direction: Axis.vertical,
//   //    mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(  height:MediaQuery.sizeOf(context).height/2,width: 300,
//           child: ListView.builder(
//             itemCount: xc.length,
//             itemBuilder: (_,index){
//             return Container(
//               height: 100,width: 300,
//               child: ListTile(title: Text(xc[index].name.toString()),
//               subtitle: Column(
//                 children: [
//                   Text("Price: ${xc[index].price.toString()}"),
//                   Text("quantity:${xc[index].quantity}")
//                 ],
//               ),
//               leading: IconButton(onPressed: (){

//     setState(() {
//         xc[index].quantity!+1;
  
//     });
//               }, icon: Icon(Icons.add)),
//               ),
//             );
//           }),
//         ),

//         Text("Toal:${total}"),
//         Text("Discount:${disc}"),
//         Text("AFter discount:${total-disc}")
//       ],
//       ),
//     );
//   }
// }