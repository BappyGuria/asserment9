import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [
    Product(
        'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
        'Pullover',
        'Black',
        'L',
        1,
        51),
    Product(
        'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
        'T-Shirt',
        'Gray',
        'L',
        1,
        30),
    Product(
        'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
        'Sport Dress',
        'Black',
        'M',
        1,
        43),
  ];

  void increaseItemCount(index){
    if (1 < products[index].productCount) {
      products[index].productCount -= 1;
    }
  }

  void decreaseItemCount(index){
    if (1 <= products[index].productCount) {
      products[index].productCount = products[index].productCount + 1;
    }
  }

  int calculateTotalAmount() {
    int total = 0;
    for (var Product in products) {
      total += Product.productCount * Product.productPrice;
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F9F9),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        backgroundColor: Color(0xFFF9F9F9),
        body: ListView(
          children: [
            Text('My Bag',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height: 150,
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      color: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Expanded(
                              flex: 2,
                              child: Image.network(products[index].image,)
                          ),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          products[index].name,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        const Icon(Icons.more_vert)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: RichText(
                                              text: TextSpan(
                                                  style: const TextStyle(
                                                      color: Color(0xFF9B9B9B)),
                                                  children: [
                                                    const TextSpan(
                                                      text: 'Color : ',
                                                    ),
                                                    TextSpan(
                                                        text: products[index]
                                                            .color,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFF222222)))
                                                  ]),
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: RichText(
                                            text: TextSpan(
                                                style: const TextStyle(
                                                    color: Color(0xFF9B9B9B)),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Size : ',
                                                  ),
                                                  TextSpan(
                                                      text: products[index].size,
                                                      style: const TextStyle(color: Color(0xFF222222)))
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                elevation: 2,
                                                shape: const CircleBorder(),
                                              ),
                                              child: const Icon(Icons.remove),
                                              onPressed: () {
                                                increaseItemCount(index);
                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                                '${products[index].productCount}'),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                elevation: 2,
                                                shape: const CircleBorder(),
                                              ),
                                              child: const Icon(Icons.add),
                                              onPressed: () {
                                                decreaseItemCount(index);
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                            '${products[index].productPrice}\$')
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 105,
          elevation: 5,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price :'),
                  Text('${calculateTotalAmount()}\$',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 28),
                  backgroundColor: const Color(0xffdb3022),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                "CHECK OUT",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),)
            ],
          ),
    )
    );
  }
}

class Product {
  String image;
  String name;
  String color;
  String size;
  int productCount;
  int productPrice;

  Product(this.image, this.name, this.color, this.size, this.productCount,
      this.productPrice);
}

//
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Product> products = [
//     Product(
//         'Pullover',
//         'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//         'Green',
//         'L',1,250),
//     Product(
//         'Bappy',
//         'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//         'Read',
//         'M',1,250),
//     Product(
//         'Bappy',
//         'https://images.unsplash.com/photo-1607860087860-c46e865f6ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3dlYXRzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//         'Orange',
//         'XL',1,250),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F9F9),
//       appBar: AppBar(
//         actions: const [
//           Icon(Icons.search),
//         ],
//       ),
//       body: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'My Bag',
//                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//               ),
//               ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 150,
//                       child: Card(
//                         surfaceTintColor: Colors.white,
//                         elevation: 5,
//                         color: Colors.white,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                                 flex: 2,
//                                 child: Image.network(
//                                     '${products[index].productImage}')),
//                             Expanded(
//                                 flex: 4,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             products[index].productName,
//                                             style: const TextStyle(
//                                                 fontSize: 25,
//                                                 fontWeight: FontWeight.normal),
//                                           ),
//                                           const Icon(Icons.more_vert)
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                               flex: 1,
//                                               child: RichText(
//                                                 text: TextSpan(
//                                                     style: const TextStyle(
//                                                         color:
//                                                         Color(0xFF9B9B9B)),
//                                                     children: [
//                                                       const TextSpan(
//                                                         text: 'Color : ',
//                                                       ),
//                                                       TextSpan(
//                                                           text:
//                                                           products[index].productColor,
//                                                           style: const TextStyle(
//                                                               color: Color(
//                                                                   0xFF222222)))
//                                                     ]),
//                                               )),
//                                           Expanded(
//                                             flex: 1,
//                                             child: Text(
//                                                 'Size : ${products[index].productSize}'),
//                                           )
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               TextButton(
//                                                 style: TextButton.styleFrom(
//                                                   backgroundColor: Colors.white,
//                                                   elevation: 2,
//                                                   shape: CircleBorder(),
//                                                 ),
//                                                 child: const Icon(
//                                                     Icons.remove
//                                                 ),
//                                                 onPressed: () {
//                                                   if(1 < products[index].productCount){
//                                                     products[index].productCount -= 1;
//                                                   }
//                                                   setState(() {
//
//                                                   });
//                                                 },
//                                               ),
//                                               Text('${products[index].productCount}'),
//                                               TextButton(
//                                                 style: TextButton.styleFrom(
//                                                   backgroundColor: Colors.white,
//                                                   elevation: 2,
//                                                   shape: const CircleBorder(),
//                                                 ),
//                                                 child: const Icon(
//                                                     Icons.add
//                                                 ),
//                                                 onPressed: () {
//                                                   // getProductIncrement();
//                                                   if(1 <= products[index].productCount){
//                                                     products[index].productCount =products[index].productCount + 1;
//                                                   }
//                                                   setState(() {
//
//                                                   });
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                           Text('${products[index].productPrice * products[index].productCount}')
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//               const SizedBox(height: 20,),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// // class Product {
// //   String productName;
// //   String productColor;
// //   String productSize;
// //   String productImage;
// //   int productCount;
// //   int productPrice;
// //
// //   Product(
// //       this.productName, this.productImage, this.productColor, this.productSize,this.productCount,this.productPrice);
// // }
