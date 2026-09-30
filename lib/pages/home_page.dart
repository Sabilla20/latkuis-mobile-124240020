import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widgets/menu_image.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _categories = ['Semua', 'Mie', 'Dimsum', 'Minuman'];

  String _query = '';
  String _category = 'Semua';

  List<Menu> get _filtered => menus.where((m) {
        final matchCategory = _category == 'Semua' || m.category == _category;
        final matchQuery =
            m.name.toLowerCase().contains(_query.toLowerCase().trim());
        return matchCategory && matchQuery;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text('Home', style: TextStyle(fontSize: 22)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchBar(
            hintText: 'Cari menu',
            leading: const Icon(Icons.search),
            elevation: const WidgetStatePropertyAll(0),
            onChanged: (v) => setState(() => _query = v),
          ),
        ),
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              for (final c in _categories)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: _category == c,
                    onSelected: (_) => setState(() => _category = c),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: items.isEmpty
              ? const Center(child: Text('Menu tidak ditemukan'))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    final menu = items[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      leading: MenuImage(
                        url: menu.image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(menu.name),
                      subtitle: Text('Rp ${menu.price}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(menu: menu),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
