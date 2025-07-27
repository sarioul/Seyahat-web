import 'package:seyahat_web/icons/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void openWhatsApp({required String phone, required String message}) async {
    final whatsappUrl = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('WhatsApp açılamıyor')));
    }
  }

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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.teal.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.teal.shade200],
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/polat.png'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'المهندس والدليل السياحي\nمعتز النعسان',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // main
              ListTile(
                leading: Icon(Icons.home, color: Colors.teal),
                title: Text('الصفحة الرئيسية'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              //names(category)
              Expanded(
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.place, color: Colors.teal),
                      title: Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                    );
                  },
                ),
              ),

              Divider(),

              // أزرار التواصل
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.green),
                      title: Text('تواصل عبر واتساب'),
                      onTap: () {
                        final phone = '905550033953';
                        final message = Uri.encodeComponent(
                          'Merhaba, bilgi almak istiyorum.',
                        );
                        final url = 'https://wa.me/$phone?text=$message';
                        launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        MyFlutterApp.instagram,
                        color: Colors.purple,
                      ),
                      title: Text('حساب إنستغرام'),
                      onTap: () {
                        final instaUsername = 'polat_samlioglu/';
                        final url = 'https://instagram.com/$instaUsername';
                        launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             colors: [Colors.teal, Colors.teal.shade200],
      //           ),
      //         ),
      //         child: Row(
      //           children: [
      //             CircleAvatar(
      //               radius: 35,
      //               backgroundImage: AssetImage('images/polat.png'),
      //             ),
      //             SizedBox(width: 10),
      //             Expanded(
      //               child: Text(
      //                 'المهندس والدليل السياحي\nمعتز النعسان',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 16,
      //                   height: 1.4,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home, color: Colors.teal),
      //         title: Text('الصفحة الرئيسية'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: names.length,
      //           itemBuilder: (context, index) {
      //             return Column(
      //               children: [
      //                 ListTile(
      //                   leading: Text(
      //                     '-  ${names[index]}',
      //                     style: TextStyle(color: Colors.teal, fontSize: 20),
      //                   ),
      //                   onTap: () {
      //                     final selectedTitle = names[index];
      //                     Navigator.pushNamed(
      //                       context,
      //                       DetayScreen.screenRoute,
      //                       arguments: {
      //                         'title': selectedTitle,
      //                         'places': catagoryData[selectedTitle],
      //                       },
      //                     );
      //                   },
      //                 ),
      //                 Divider(
      //                   thickness: 1,
      //                   height: 20,
      //                   color: Colors.teal[700],
      //                 ),
      //               ],
      //             );
      //           },
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           final phone = '905550033953';
      //           final message =
      //               'Merhabalar,Bunun Hakkında bilgi almak istiyorum :';
      //           openWhatsApp(phone: phone, message: message);
      //         },
      //         icon: Icon(Icons.phone, color: Colors.white),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
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
