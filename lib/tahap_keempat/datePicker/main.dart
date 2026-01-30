import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Date Picker Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _selectedDate;

  // Fungsi untuk menampilkan date picker
  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              // ini tuh semua dari color pallet
              primary: Colors.deepPurple, // Warna header
              onPrimary: Colors.white, // Warna teks header
              surface: Colors.white, // Warna background
              onSurface: Colors.black, // Warna teks
            ),
          ),
          child: child!,
        );
      },
    );

    // Jika user memilih tanggal (bukan menekan cancel)
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });

      // Navigasi ke halaman detail dengan membawa data tanggal
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(selectedDate: pickedDate),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected date (if any)
            if (_selectedDate != null)
              Text(
                'Tanggal Terpilih: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            
            // Button untuk membuka date picker
            ElevatedButton.icon(
              onPressed: () => _showDatePicker(context),
              icon: const Icon(Icons.calendar_today),
              label: const Text('Pilih Tanggal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Informasi
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                
                  SizedBox(height: 10),
                 
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman detail untuk menampilkan tanggal yang dipilih
class DetailPage extends StatelessWidget {
  final DateTime selectedDate;
  
  const DetailPage({super.key, required this.selectedDate});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tanggal'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon besar
              const Icon(
                Icons.calendar_month,
                size: 100,
                color: Colors.deepPurple,
              ),
              
              const SizedBox(height: 30),
              
              // Judul
              Text(
                "Detail Tanggal yang Dipilih ${selectedDate}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              
              const SizedBox(height: 40),
              
   
              
              // Tombol untuk kembali
              FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
               
                child: const Text('back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'iOS Date Picker Demo',
//       theme: const CupertinoThemeData(
//         primaryColor: CupertinoColors.systemBlue,
//         barBackgroundColor: CupertinoColors.systemBackground,
//         scaffoldBackgroundColor: CupertinoColors.systemBackground,
//       ),
//       home: const HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   DateTime? _selectedDate;
//   bool _showDatePicker = false;
//   DateTime _tempDate = DateTime.now();

//   // Fungsi untuk menampilkan date picker gaya iOS
//   void _showIOSDatePicker(BuildContext context) {
//     setState(() {
//       _showDatePicker = true;
//       _tempDate = _selectedDate ?? DateTime.now();
//     });
    
//     // Modal bottom sheet dengan gaya iOS
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 300,
//           color: CupertinoColors.systemBackground.resolveFrom(context),
//           child: Column(
//             children: [
//               // Header dengan Done dan Cancel buttons
//               Container(
//                 decoration: BoxDecoration(
//                   color: CupertinoColors.systemBackground.resolveFrom(context),
//                   border: Border(
//                     bottom: BorderSide(
//                       color: CupertinoColors.separator.resolveFrom(context),
//                       width: 0.5,
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CupertinoButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         setState(() {
//                           _showDatePicker = false;
//                         });
//                       },
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           color: CupertinoColors.systemBlue,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'Pilih Tanggal',
//                       style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     CupertinoButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         setState(() {
//                           _selectedDate = _tempDate;
//                           _showDatePicker = false;
//                         });
                        
//                         // Navigasi ke halaman detail dengan membawa data tanggal
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => DetailPage(selectedDate: _tempDate),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Done',
//                         style: TextStyle(
//                           color: CupertinoColors.systemBlue,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               // Cupertino Date Picker
//               Expanded(
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.date,
//                   initialDateTime: _tempDate,
//                   minimumDate: DateTime(2000),
//                   maximumDate: DateTime(2100),
//                   onDateTimeChanged: (DateTime newDate) {
//                     setState(() {
//                       _tempDate = newDate;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ).then((_) {
//       setState(() {
//         _showDatePicker = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text('Date Picker iOS Style'),
//         backgroundColor: CupertinoColors.systemBackground,
//         border: null,
//       ),
//       child: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Display selected date dengan gaya iOS
//               if (_selectedDate != null)
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.systemBlue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       const Icon(
//                         CupertinoIcons.calendar,
//                         size: 40,
//                         color: CupertinoColors.systemBlue,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Tanggal Dipilih',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: CupertinoColors.secondaryLabel.resolveFrom(context),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                           color: CupertinoColors.systemBlue,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
              
//               const SizedBox(height: 40),
              
//               // Button untuk membuka date picker
//               CupertinoButton.filled(
//                 onPressed: () => _showIOSDatePicker(context),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(CupertinoIcons.calendar),
//                     SizedBox(width: 8),
//                     Text('Pilih Tanggal'),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 30),
              
//               // Informasi tambahan dengan gaya iOS
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: CupertinoColors.systemGrey6,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
                   
                   
                    
//                   ]
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Halaman detail dengan gaya iOS
// class DetailPage extends StatelessWidget {
//   final DateTime selectedDate;
  
//   const DetailPage({super.key, required this.selectedDate});

  
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text('Detail Tanggal'),
//         leading: CupertinoButton(
//           padding: EdgeInsets.zero,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(CupertinoIcons.back),
//         ),
//       ),
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Header dengan ikon besar
//                 Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: CupertinoColors.systemBlue.withOpacity(0.1),
//                   ),
//                   child: const Icon(
//                     CupertinoIcons.calendar_today,
//                     size: 60,
//                     color: CupertinoColors.systemBlue,
//                   ),
//                 ),
                
//                 const SizedBox(height: 30),
                
//                 // Tanggal yang diformat dengan indah
               
                
//                 const SizedBox(height: 10),
                
//                 Text(
//                   'Tanggal yang Anda pilih ${selectedDate}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: CupertinoColors.secondaryLabel.resolveFrom(context),
//                   ),
//                 ),
                
//                 const SizedBox(height: 40),
                
//                 // Card dengan informasi detail
//                 Container(
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.systemBackground,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: CupertinoColors.systemGrey.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       // Header card
                   
                      
//                       // Konten card
                      
//                     ],
//                   ),
//                 ),
                
//                 const SizedBox(height: 40),
                
//                 // Tombol untuk kembali
//                 CupertinoButton.filled(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(CupertinoIcons.arrow_left),
//                       SizedBox(width: 8),
//                       Text('Kembali ke Home'),
//                     ],
//                   ),
//                 ),
                
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  
//   Widget _buildDetailRow({
//     required IconData icon,
//     required String title,
//     required String value,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           icon,
//           color: CupertinoColors.systemBlue,
//           size: 24,
//         ),
//         const SizedBox(width: 15),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               const SizedBox(height: 5),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: CupertinoColors.label,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
  
//   bool _isLeapYear(int year) {
//     return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
//   }
// }