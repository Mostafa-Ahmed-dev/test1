import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

List items = [];
GlobalKey<AnimatedListState> key = GlobalKey();

addItem() {
  items.insert(0, "Item${items.length + 1}");
  key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
}

removeItem(int index) {
  key.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: const Card(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              child: ListTile(
                title: Text(
                  'deleted',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
      duration: const Duration(milliseconds: 300));
  items.removeAt(index);
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Animated List'),
          centerTitle: true,
          leading: const SizedBox(),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () => addItem(),
              icon: const Icon(Icons.add),
            ),
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: 0,
                padding: const EdgeInsets.all(10),
                itemBuilder: ((context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    key: UniqueKey(),
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.purple,
                      child: ListTile(
                        textColor: Colors.white,
                        title: Text(
                          items[index],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              removeItem(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ));
  }
}
