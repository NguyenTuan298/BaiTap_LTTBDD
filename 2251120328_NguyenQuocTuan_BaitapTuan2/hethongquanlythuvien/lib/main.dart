import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: const LibraryHomePage(),
  debugShowCheckedModeBanner: false,
  routes: {
    '/users': (context) => const UserPage(),
    '/borrow': (context) => BorrowPage(books: ModalRoute.of(context)?.settings.arguments as List<BookItem>),
  },
));

// MODELS
class BookItem {
  final int id;
  final String title;
  final String author;
  final bool isAvailable;
  bool isSelected;

  BookItem({
    required this.id,
    required this.title,
    this.author = 'Tác giả',
    this.isAvailable = true,
    required this.isSelected,
  });
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final List<BookItem> borrowedBooks;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.borrowedBooks = const [],
  });
}

// Home
class LibraryHomePage extends StatefulWidget {
  const LibraryHomePage({super.key});

  @override
  State<LibraryHomePage> createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  final TextEditingController _staffNameController = TextEditingController(text: 'Nguyen Van A');
  final List<BookItem> _books = [
    BookItem(id: 1, title: 'Sách 01', author: 'Tác giả A', isSelected: false),          // isSelected : false => không được chọn
    BookItem(id: 2, title: 'Sách 02', author: 'Tác giả B', isSelected: false),
    BookItem(id: 3, title: 'Sách 03', author: 'Tác giả C', isSelected: false),
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    _staffNameController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    setState(() => _currentIndex = index);
    if (index == 2) Navigator.pushNamed(context, '/users');
  }

  void _addNewBook() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm sách mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Tên sách', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Tác giả', border: OutlineInputBorder())),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              setState(() => _books.add(BookItem(id: _books.length + 1, title: 'Sách ${_books.length + 1}', author: 'Tác giả mới', isSelected: false)));
              Navigator.pop(context);
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, toolbarHeight: 0),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(child: Text('Hệ thống\nQuản lý Thư viện', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold))),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nhân viên', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: TextField(controller: _staffNameController, decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12)))),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white), child: const Text('Đổi')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Danh sách sách', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      if (_books.any((book) => book.isSelected)) Navigator.pushNamed(context, '/borrow', arguments: _books);
                      else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng chọn sách để mượn')));
                    },
                    child: const Text('Mượn sách', style: TextStyle(fontSize: 17)),
                  ),
                ]),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(10),
                  child: Column(children: _books.map((book) => _buildBookItem(book)).toList()),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(onPressed: _addNewBook, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white), child: const Text('Thêm')),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildBookItem(BookItem book) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[300]!)),
      child: CheckboxListTile(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(book.title), Text(book.author, style: TextStyle(fontSize: 12, color: Colors.grey[600]))]),
        controlAffinity: ListTileControlAffinity.leading,
        value: book.isSelected,
        activeColor: Colors.red,
        checkColor: Colors.white,
        onChanged: book.isAvailable ? (value) => setState(() => book.isSelected = value ?? false) : null,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _navigateToPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
        BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'DS Sách'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}

// BORROW PAGE
class BorrowPage extends StatelessWidget {
  final List<BookItem> books;

  const BorrowPage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final borrowedBooks = books.where((book) => book.isSelected).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Sách mượn')),
      body: borrowedBooks.isEmpty
          ? const Center(child: Text('Không có sách nào được mượn.'))
          : ListView.builder(
        itemCount: borrowedBooks.length,
        itemBuilder: (context, index) {
          final book = borrowedBooks[index];
          return ListTile(title: Text(book.title), subtitle: Text('Tác giả: ${book.author}'));
        },
      ),
    );
  }
}

// USER PAGE
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Danh sách người dùng')), body: const Center(child: Text('Tính năng đang phát triển...')));
}
