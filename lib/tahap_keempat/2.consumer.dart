

// Provider.of
// Digunakan untuk mengakses provider.
// Jika listen: true (default), maka widget akan rebuild ketika data berubah.
// Jika listen: false, maka tidak akan rebuild.

// Consumer
// Widget yang khusus untuk mengonsumsi provider.
// Hanya widget di dalam builder yang akan rebuild ketika data berubah.
// Dapat memiliki child yang tidak rebuild (parameter child).

// Selector
// Seperti Consumer, tetapi hanya rebuild jika data yang dipilih berubah.
// Lebih efisien karena tidak rebuild untuk perubahan yang tidak diperlukan.
// Selector<Counter, int>(
//   selector: (context, counter) => counter.count,
//   builder: (context, count, child) {
//     return Text('Count: $count');
//   },
// )


// Cara Mengakses Provider
// 1. Consumer (Selalu Listen)
// dart
// Consumer<Counter>(
//   builder: (context, counter, child) {
//     return Text('${counter.count}');
//   },
// )
// 2. Provider.of dengan listen: true (Default)
// dart
// @override
// Widget build(BuildContext context) {
//   final counter = Provider.of<Counter>(context); // listen: true
//   return Text('${counter.count}');
// }
// 3. Provider.of dengan listen: false
// dart
// FloatingActionButton(
//   onPressed: () {
        // biasanya di pake untuk dpetin atau untuk hanya menjalakan
        // sebuah fugnsi
//     // Hanya akses data, tidak perlu rebuild
//     Provider.of<Counter>(context, listen: false).increment();
//   },
// )
// 4. Selector (Efisien)
// dart
// Selector<Counter, int>(
//   selector: (context, counter) => counter.count,
//   builder: (context, count, child) {
//     return Text('$count');
//   },
// )


// DO:
// Letakkan Provider setinggi mungkin di widget tree
// Gunakan Consumer untuk widget kecil/spesifik
// Gunakan listen: false untuk methods/actions
// Gunakan Selectors untuk object kompleks

// DON'T:
// Jangan letakkan Provider di dalam widget yang sering rebuild
// Jangan gunakan listen: true di dalam actions/buttons
// Jangan lupa panggil notifyListeners()

// https://chat.deepseek.com/a/chat/s/58c23f4f-bf54-426d-adf7-015793fe7b0b