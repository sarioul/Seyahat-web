// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class DetayScreen extends StatefulWidget {
//   static final String screenRoute = 'detay_screen';

//   const DetayScreen({super.key});

//   @override
//   State<DetayScreen> createState() => _DetayScreenState();
// }

// class _DetayScreenState extends State<DetayScreen> {
//   List<int> _currentIndexes = [];

//   @override
//   Widget build(BuildContext context) {
//     final args =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     final String title = args['title'];
//     //final List<String> imageSlider = List<String>.from(args['imageSlider']);
//     final List<Map<String, dynamic>> places = List<Map<String, dynamic>>.from(
//       args['places'],
//     );
//     if (_currentIndexes.length != places.length) {
//       _currentIndexes = List.generate(places.length, (_) => 0);
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text('$title '), backgroundColor: Colors.teal),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 300,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: ListView.builder(
//                     itemCount: places.length,
//                     itemBuilder: (context, index) {
//                       final place = places[index];
//                       final name = place['name'];
//                       final images = List<String>.from(place['images']);

//                       return Container(
//                         margin: EdgeInsets.all(14),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black,
//                               blurRadius: 10,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 name,
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.teal,
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               SizedBox(
//                                 height: 200,
//                                 child: PageView.builder(
//                                   onPageChanged: (pageIndex) {
//                                     setState(() {
//                                       _currentIndexes[index] = pageIndex;
//                                     });
//                                   },
//                                   itemCount: images.length,
//                                   itemBuilder: (context, i) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 8,
//                                       ),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(12),
//                                         child: Image.asset(
//                                           images[i],
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: List.generate(
//                                   images.length,
//                                   (i) => AnimatedContainer(
//                                     duration: Duration(milliseconds: 300),

//                                     margin: EdgeInsets.symmetric(
//                                       horizontal: 4,
//                                       vertical: 8,
//                                     ),
//                                     width: _currentIndexes[index] == i ? 20 : 8,
//                                     height: 8,
//                                     decoration: BoxDecoration(
//                                       color: _currentIndexes[index] == i
//                                           ? Colors.teal
//                                           : Colors.grey.shade300,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetayScreen extends StatefulWidget {
  static final String screenRoute = 'detay_screen';

  const DetayScreen({super.key});

  @override
  State<DetayScreen> createState() => _DetayScreenState();
}

class _DetayScreenState extends State<DetayScreen> {
  List<int> _currentIndexes = [];

  void openWhatsApp({required String phone, required String message}) async {
    final whatsappUrl = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('لا يمكن فتح WhatsApp')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String title = args['title'];
    final List<Map<String, dynamic>> places = List<Map<String, dynamic>>.from(
      args['places'],
    );
    if (_currentIndexes.length != places.length) {
      _currentIndexes = List.generate(places.length, (_) => 0);
    }

    return Scaffold(
      appBar: AppBar(title: Text('$title '), backgroundColor: Colors.teal),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      final name = place['name'];
                      final images = List<String>.from(place['images']);

                      return Container(
                        margin: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 200,
                                child: PageView.builder(
                                  onPageChanged: (pageIndex) {
                                    setState(() {
                                      _currentIndexes[index] = pageIndex;
                                    });
                                  },
                                  itemCount: images.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          images[i],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  images.length,
                                  (i) => AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 8,
                                    ),
                                    width: _currentIndexes[index] == i ? 20 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: _currentIndexes[index] == i
                                          ? Colors.teal
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  final phone = '905510110860';
                                  final message =
                                      'Merhabalar,Bunun Hakkında bilgi almak istiyorum $name';
                                  openWhatsApp(phone: phone, message: message);
                                },
                                icon: Icon(Icons.phone, color: Colors.white),
                                label: Text('WhatsApp\' Bağlan'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: Size(double.infinity, 40),
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
            ),
          ),
        ],
      ),
    );
  }
}
