import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todoLists = List.generate(100, (index) {
    return TodoItem(id: index, text: 'Belajar Flutter ${index}');
  });

  List<TodoItem> todoDelete = [];
  List<TodoItem> todoCheck = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Bagian atas untuk menampilkan data yang di-delete dan di-check
          Container(
            height: 300,
            child: Row(
              children: [
                // Panel Delete
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Deleted Items (${todoDelete.length})",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: todoDelete.isEmpty
                              ? Center(child: Text('No deleted items'))
                              : ListView.builder(
                                  itemCount: todoDelete.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.red[50],
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: ListTile(
                                        leading: Icon(Icons.delete,
                                            color: Colors.red),
                                        title: Text(todoDelete[index].text),
                                        subtitle: Text('Deleted'),
                                        trailing: IconButton(
                                          icon: Icon(Icons.restore,
                                              color: Colors.green),
                                          onPressed: () {
                                            _restoreDeletedItem(index);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Panel Check
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Checked Items (${todoCheck.length})",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: todoCheck.isEmpty
                              ? Center(child: Text('No checked items'))
                              : ListView.builder(
                                  itemCount: todoCheck.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.green[50],
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: ListTile(
                                        leading: Icon(Icons.check_circle,
                                            color: Colors.green),
                                        title: Text(todoCheck[index].text),
                                        subtitle: Text('Checked'),
                                        trailing: IconButton(
                                          icon: Icon(Icons.undo,
                                              color: Colors.blue),
                                          onPressed: () {
                                            _restoreCheckedItem(index);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // List Todo Aktif
          Expanded(
            child: ListView.builder(
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                return _buildDismissibleItem(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewItem();
        },
        child: Icon(Icons.add),
        tooltip: 'Add new item',
      ),
    );
  }

  // Widget untuk item yang bisa di-dismiss
  Widget _buildDismissibleItem(int index) {
    final item = todoLists[index];
    
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.horizontal,
      
      // Background ketika geser ke kanan (check)
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.check, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Text(
                'MARK AS DONE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Background ketika geser ke kiri (delete)
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'DELETE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.delete, color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
      
      // Konfirmasi sebelum dismiss (khusus untuk delete)
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // Untuk delete, tampilkan dialog konfirmasi
          return await _showDeleteConfirmation(context);
        }
        // Untuk check, langsung approve tanpa konfirmasi
        return true;
      },
      
      // Setelah dismiss dikonfirmasi
      onDismissed: (direction) {
        final removedItem = todoLists[index];
        
        setState(() {
          // Hapus dari todoLists
          todoLists.removeAt(index);
          
          // Tambahkan ke list yang sesuai
          if (direction == DismissDirection.startToEnd) {
            // Check (geser ke kanan)
            todoCheck.add(removedItem);
          } else if (direction == DismissDirection.endToStart) {
            // Delete (geser ke kiri)
            todoDelete.add(removedItem);
          }
        });
        
        // Tampilkan SnackBar dengan opsi undo
        _showUndoSnackBar(context, removedItem, index, direction);
      },
      
      // Konten item
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(Icons.task, color: Colors.blue),
          ),
          title: Text(
            item.text,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('ID: ${item.id} • Geser kiri/kanan'),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Edit'),
                value: 'edit',
              ),
              PopupMenuItem(
                child: Text('Delete'),
                value: 'delete',
              ),
            ],
            onSelected: (value) {
              if (value == 'edit') {
                _editItem(index);
              } else if (value == 'delete') {
                _deleteItemWithDialog(index);
              }
            },
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi delete
  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus item ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('BATAL'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'HAPUS',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    ) ?? false; // Default false jika dialog ditutup tanpa pilihan
  }

  // Fungsi untuk menampilkan SnackBar dengan opsi undo
  void _showUndoSnackBar(BuildContext context, TodoItem item, int originalIndex, DismissDirection direction) {
    final snackBar = SnackBar(
      content: Text(
        direction == DismissDirection.startToEnd
            ? 'Item ditandai sebagai selesai'
            : 'Item dihapus',
      ),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: 'BATAL',
        onPressed: () {
          // Kembalikan item ke posisi semula
          setState(() {
            todoLists.insert(originalIndex, item);
            
            // Hapus dari list tujuan
            if (direction == DismissDirection.startToEnd) {
              todoCheck.remove(item);
            } else if (direction == DismissDirection.endToStart) {
              todoDelete.remove(item);
            }
          });
        },
      ),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Fungsi untuk mengembalikan item dari deleted list
  void _restoreDeletedItem(int index) {
    setState(() {
      final item = todoDelete[index];
      todoDelete.removeAt(index);
      todoLists.add(item);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item dikembalikan'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Fungsi untuk mengembalikan item dari checked list
  void _restoreCheckedItem(int index) {
    setState(() {
      final item = todoCheck[index];
      todoCheck.removeAt(index);
      todoLists.add(item);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item dikembalikan ke todo list'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Fungsi untuk menambah item baru
  void _addNewItem() {
    final textController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Item Baru'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Masukkan teks todo',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('BATAL'),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  setState(() {
                    final newId = todoLists.length;
                    todoLists.add(
                      TodoItem(
                        id: newId,
                        text: textController.text,
                      ),
                    );
                  });
                  Navigator.pop(context);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Item berhasil ditambahkan'),
                    ),
                  );
                }
              },
              child: Text('SIMPAN'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk mengedit item
  void _editItem(int index) {
    final textController = TextEditingController(text: todoLists[index].text);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Edit teks todo',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('BATAL'),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  setState(() {
                    todoLists[index] = TodoItem(
                      id: todoLists[index].id,
                      text: textController.text,
                    );
                  });
                  Navigator.pop(context);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Item berhasil diedit'),
                    ),
                  );
                }
              },
              child: Text('SIMPAN'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menghapus item dengan dialog (dari popup menu)
  void _deleteItemWithDialog(int index) async {
    final confirmed = await _showDeleteConfirmation(context);
    
    if (confirmed) {
      final removedItem = todoLists[index];
      
      setState(() {
        todoLists.removeAt(index);
        todoDelete.add(removedItem);
      });
      
      // Tampilkan SnackBar dengan opsi undo
      _showUndoSnackBar(context, removedItem, index, DismissDirection.endToStart);
    }
  }
}

class TodoItem {
  final int id;
  final String text;
  
  TodoItem({required this.id, required this.text});
}