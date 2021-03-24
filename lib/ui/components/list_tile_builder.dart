import 'package:flutter/cupertino.dart';
import 'package:sync_play/ui/components/list_tile_spacer.dart';

class ListTileBuilder extends StatelessWidget {
  final List<Widget> children;

  const ListTileBuilder({Key? key, required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _children = List.generate(
      children.length * 2 + 1,
      (index) {
        if (index.isEven) {
          return ListTileSpacer();
        } else {
          return children[index ~/ 2];
        }
      },
    );
    return Column(
      children: _children,
    );
  }
}
