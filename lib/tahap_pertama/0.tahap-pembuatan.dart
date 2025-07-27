
// BuildContext context kalo ini itu fungsinya adaalh untuk menjadikan widget kita 
// uniq, dan tahu alaatnya, untuk apa kita mnggunakna key ?
// nah jadi simplenya itu
// kalo buildcontext itu adalah sebuah objek yang merepresentasikan
// posisi widget kita di dalam widget tree

// nah kalo key ini itu untuk mengidentifikasi widget kita
// jadi kalo kita punya widget yang sama, misal Text("halo")
// nah kita bisa kasih key, supaya dia itu unik


// jadi Widget build(Context context) {}
// ini akna dijalankan oleh si fungsi StatelessElement(this) yang ada di
// fungsi bawaan dari StatelessWidget
// yaitu createElement()

// class StatelessElement extends ComponentElement {
//   ...
//   @override
//   Widget build() => widget.build(this);
// }

// nah lihat, dia menjalankan widget.build(this);
// berati yang menjalanakn build itu adalah widget yang ada di StatelessElement



// https://chatgpt.com/c/688591a7-2a4c-8009-8adc-0dd11224fe9d

// 1.
// Kamu membuat instance MyApp()
// Ini adalah objek dari StatelessWidget yang kamu buat.

// Tapi ini hanya objek biasa, belum terjadi apa-apa di layar.

// 2.
// Kamu menjalankan runApp(MyApp())
// Flutter menerima widget MyApp.
// Ini memicu proses pembentukan tree pertama kali (widget tree → element tree → render tree).


// 3.
// Flutter memanggil MyApp.createElement()
// Kamu tidak override method ini sendiri, karena:

// StatelessWidget sudah punya implementasinya:
// @override
// StatelessElement createElement() => StatelessElement(this);

// 4.
// Lalu Flutter menjalankan StatelessElement.mount()
// Ini tugasnya: pasang Element ke dalam element tree

// Dalam proses ini, Flutter memanggil:

// widget.build(context);
// Nah, widget di sini adalah MyApp, jadi dia akan memanggil build() milik kamu.


// penting nih
// 5.
// build(context) mengembalikan Widget (misalnya Text("Halo Dunia"))
// Ini bukan langsung digambar ke layar, tapi:

// Flutter akan memanggil createElement() lagi untuk Text

// Lalu mount() lagi untuk Text

// Dan seterusnya secara rekursif

// 6.
//  Setelah semua Element selesai dibuat → Flutter membangun RenderObject untuk masing-masing
// Misalnya Text punya RenderParagraph

// Row punya RenderFlex, dll

// 7.
// Setelah Render Tree siap → Flutter menjalankan:
// Layout phase → mengatur ukuran dan posisi

// Paint phase → menggambar piksel ke layar

// Compositing phase → mengatur tumpukan layer

// Rendering selesai 


// runApp(MyApp())
// ↓
// MyApp.createElement() → StatelessElement
// ↓
// StatelessElement.mount()
// ↓
// MyApp.build(context) → kembalikan widget-child (misal: Text)
// ↓
// createElement() dan mount() untuk Text
// ↓
// ...
// ↓
// Element Tree selesai dibuat
// ↓
// Render Tree dibangun dari element
// ↓
// Layout → Paint → Display di layar


// buildcontext
// 1.
// abstract class Widget {
//   Element createElement();
// }
// Misalnya kamu punya:
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Halo');
//   }
// }
// Ketika Flutter memproses MyWidget, ia akan memanggil:

// Element element = myWidget.createElement();
// Dalam hal StatelessWidget, createElement() mengembalikan:

// StatelessElement(this); // this = widget MyWidget itu sendiri
// karena this dalam parent classnya ini merujuk ke si objek instance
// /baik itu dalam parentnya atau dalam childnya


// 2.
// StatelessElement Adalah BuildContext

// class StatelessElement extends ComponentElement {
//   ...
//   @override
//   Widget build() => widget.build(this);
// }
// ⚠ Perhatikan: this di sini adalah StatelessElement, dan itu yang dikirim sebagai BuildContext.

// Jadi, saat kamu override:

// Widget build(BuildContext context) {
//   return Text('Halo');
// }
// context itu sebenarnya adalah instance dari StatelessElement!


// [Widget]
//    ↓ createElement()
// [Element] ← BuildContext
//    ↓ build(this)
// [build(BuildContext context)] ← context = element
//    ↓ return child widget



// ----
// Text('Halo') // ini Widget
// ↓
// createElement() → StatelessElement // ini Element
// ↓
// Element.mount() // pasang ke pohon
// ↓
// Element.build() // panggil widget.build(this)
// ↓
// RenderObject // jika ada tampilan, siapkan render-nya



// ---------
/**
 * ╔════════════════════════════════════════════════════════════════════════╗
 * ║                     Perbandingan: Widget vs Element                    ║
 * ╠═══════════════╦════════════════════════════╦══════════════════════════╣
 * ║     Aspek     ║         Widget             ║          Element         ║
 * ╠═══════════════╬════════════════════════════╬══════════════════════════╣
 * ║ 🧱 Tipe        ║ Blueprint / deklarasi      ║ Objek nyata / aktif      ║
 * ║ 🧠 Fungsi      ║ Menentukan apa yang dibangun║ Menentukan bagaimana &  ║
 * ║               ║                            ║ di mana dibangun         ║
 * ║ 📍 Disimpan di ║ Widget Tree (sementara)    ║ Element Tree (lebih stabil)║
 * ║ 🔄 Lifecycle   ║ Dapat berubah saat rebuild ║ Bisa dipertahankan       ║
 * ║               ║ (ganti objek baru)         ║ (recycle element lama)   ║
 * ║ 🔗 Hubungan    ║ Stateless & StatefulWidget ║ StatelessElement /       ║
 * ║               ║                            ║ StatefulElement          ║
 * ║ 💬 Contoh      ║ Text('Halo')               ║ StatelessElement         ║
 * ╚═══════════════╩════════════════════════════╩══════════════════════════╝
 */
