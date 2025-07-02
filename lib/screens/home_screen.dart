import '../screens/detay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static final String screenRoute = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, List<Map<String, dynamic>>> catagoryData = {
    'Bungalov Evler': [
      {
        'name': 'Rize Bungalov',
        'images': [
          'images/bungalov/1/1.png',
          'images/bungalov/1/2.png',
          'images/bungalov/1/3.png',
          'images/bungalov/1/4.png',
        ],
      },
      {
        'name': 'Ayder Yaylası Bungalov',
        'images': [
          'images/bungalov/2/1.png',
          'images/bungalov/2/2.png',
          'images/bungalov/2/3.png',
          'images/bungalov/2/4.png',
        ],
      },
      {
        'name': 'Rize Bungalov',
        'images': [
          'images/bungalov/3/1.png',
          'images/bungalov/3/2.png',
          'images/bungalov/3/3.png',
          'images/bungalov/3/4.png',
        ],
      },
    ],
    'Hoteller': [
      {
        'name': 'Marina green Hotel',
        'images': [
          'images/hoteller/marina_green_hotel/1.png',
          'images/hoteller/marina_green_hotel/2.png',
          'images/hoteller/marina_green_hotel/3.png',
          'images/hoteller/marina_green_hotel/4.png',
          'images/hoteller/marina_green_hotel/5.png',
          'images/hoteller/marina_green_hotel/6.png',
        ],
      },
      {
        'name': 'Satana Hotel',
        'images': [
          'images/hoteller/satana_hotel/1.png',
          'images/hoteller/satana_hotel/2.png',
          'images/hoteller/satana_hotel/3.png',
          'images/hoteller/satana_hotel/4.png',
          'images/hoteller/satana_hotel/5.png',
          'images/hoteller/satana_hotel/6.png',
        ],
      },
      {
        'name': 'White House Hotel',
        'images': [
          'images/hoteller/white_house_hotel/1.png',
          'images/hoteller/white_house_hotel/2.png',
          'images/hoteller/white_house_hotel/3.png',
          'images/hoteller/white_house_hotel/4.png',
          'images/hoteller/white_house_hotel/5.png',
          'images/hoteller/white_house_hotel/6.png',
        ],
      },
    ],

    'Arabalar': [
      {
        'name': 'Mercedes',
        'images': [
          'images/mercedes/1.png',
          'images/mercedes/2.png',
          'images/mercedes/3.png',
          'images/mercedes/4.png',
        ],
      },
      {
        'name': 'BMW',
        'images': [
          'images/bmw/1.png',
          'images/bmw/2.png',
          'images/bmw/3.png',
          'images/bmw/4.png',
        ],
      },
      {
        'name': 'tesla',
        'images': [
          'images/tesla/1.png',
          'images/tesla/2.png',
          'images/tesla/3.png',
          'images/tesla/4.png',
        ],
      },
    ],
    'Şöfürlü arabalar': [
      {
        'name': 'Mercedes',
        'images': [
          'images/mercedes/1.png',
          'images/mercedes/2.png',
          'images/mercedes/3.png',
          'images/mercedes/4.png',
        ],
      },
      {
        'name': 'BMW',
        'images': [
          'images/bmw/1.png',
          'images/bmw/2.png',
          'images/bmw/3.png',
          'images/bmw/4.png',
        ],
      },
      {
        'name': 'tesla',
        'images': [
          'images/tesla/1.png',
          'images/tesla/2.png',
          'images/tesla/3.png',
          'images/tesla/4.png',
        ],
      },
    ],
  };

  List images = [
    'images/bungalov.jpg',
    'images/hotel.jpg',
    'images/araba_1.png',
    'images/araba_2.png',
  ];
  List names = ['Bungalov Evler', 'Hoteller', 'Arabalar', 'Şöfürlü arabalar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('Seyahat Rehberim'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 5 / 7,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: InkWell(
                splashColor: Colors.teal,
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  final selectedTitle = names[index];
                  Navigator.pushNamed(
                    context,
                    DetayScreen.screenRoute,
                    arguments: {
                      'title': selectedTitle,
                      'places': catagoryData[selectedTitle],
                    },
                  );
                },
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                      alignment: Alignment.center,
                      child: Text(
                        names[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'detay_screen.dart';

// class HomeScreen extends StatelessWidget {
//   static const screenRoute = 'home_screen';

//   final List<String> names = [
//     'Bungalov Evler',
//     'Hoteller',
//     'Dağlar',
//     'Göller',
//     'Ormanlar',
//     'Tarihi Yerler',
//     'Yaylalar',
//   ];

//   final List<String> images = [
//     'images/bungalov.jpg',
//     'images/hotel.jpg',
//     'images/daglar.jpg',
//     'images/goller.jpg',
//     'images/orman.jpg',
//     'images/tarihi_yerler.jpg',
//     'images/yaylalar.jpg',
//   ];

//   final Map<String, List<Map<String, dynamic>>> catagoryData = {
//     'Bungalov Evler': [
//       {
//         'name': 'Rize Bungalov',
//         'images': [
//           'images/bungalov/1/1.png',
//           'images/bungalov/1/2.png',
//           'images/bungalov/1/3.png',
//           'images/bungalov/1/4.png',
//         ],
//       },
//       {
//         'name': 'Ayder Yaylası Bungalov',
//         'images': [
//           'images/bungalov/2/1.png',
//           'images/bungalov/2/2.png',
//           'images/bungalov/2/3.png',
//           'images/bungalov/2/4.png',
//         ],
//       },
//       {
//         'name': 'Rize Bungalov',
//         'images': [
//           'images/bungalov/3/1.png',
//           'images/bungalov/3/2.png',
//           'images/bungalov/3/3.png',
//           'images/bungalov/3/4.png',
//         ],
//       },
//     ],
//     'Hoteller': [
//       {
//         'name': 'Marina green Hotel',
//         'images': [
//           'images/hoteller/marina_green_hotel/1',
//           'images/hoteller/marina_green_hotel/2',
//           'images/hoteller/marina_green_hotel/3',
//           'images/hoteller/marina_green_hotel/4',
//           'images/hoteller/marina_green_hotel/5',
//           'images/hoteller/marina_green_hotel/6',
//         ],
//       },
//       {
//         'name': 'Satana Hotel',
//         'images': [
//           'images/hoteller/satana_hotel/1',
//           'images/hoteller/satana_hotel/2',
//           'images/hoteller/satana_hotel/3',
//           'images/hoteller/satana_hotel/4',
//           'images/hoteller/satana_hotel/5',
//           'images/hoteller/satana_hotel/6',
//         ],
//       },
//       {
//         'name': 'White House Hotel',
//         'images': [
//           'images/hoteller/white_house_hotel/1',
//           'images/hoteller/white_house_hotel/2',
//           'images/hoteller/white_house_hotel/3',
//           'images/hoteller/white_house_hotel/4',
//           'images/hoteller/white_house_hotel/5',
//           'images/hoteller/white_house_hotel/6',
//         ],
//       },
//     ],

//     'Dağlar': [
//       {
//         'name': 'Rize_Bungalov',
//         'images': [
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//         ],
//       },
//     ],
//     'Göller': [
//       {
//         'name': 'Uzungöl',
//         'images': [
//           'images/uzungol-1.jpg',
//           'images/uzungol-2.jpg',
//           'images/uzungol-3.jpg',
//         ],
//       },
//       {
//         'name': 'limni_Gölü',
//         'images': [
//           'images/uzungol-1.jpg',
//           'images/uzungol-2.jpg',
//           'images/uzungol-3.jpg',
//         ],
//       },
//     ],
//     'Ormanlar': [
//       {
//         'name': 'Rize_Bungalov',
//         'images': [
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//         ],
//       },
//     ],
//     'Tarihi Yerler': [
//       {
//         'name': 'Rize_Bungalov',
//         'images': [
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//         ],
//       },
//     ],
//     'Yaylalar': [
//       {
//         'name': 'Rize_Bungalov',
//         'images': [
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//           'images/bungalov.jpg',
//           'images/daglar.jpg',
//         ],
//       },
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             // الخلفية الأساسية
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.teal.shade200, Colors.teal.shade900],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Text(
//                     'Seyahat Rehberim',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     padding: EdgeInsets.all(10),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                       childAspectRatio: 5 / 7,
//                     ),
//                     itemCount: names.length,
//                     itemBuilder: (context, index) {
//                       final name = names[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             DetayScreen.screenRoute,
//                             arguments: {
//                               'title': name,
//                               'places': catagoryData[name],
//                             },
//                           );
//                         },
//                         child: Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(16),
//                               child: Image.asset(
//                                 images[index],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                                 height: double.infinity,
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.4),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 name,
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
