import 'package:flutter/cupertino.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Histórico'),
            previousPageTitle: 'Perfil',
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'Em breve...',
                style:
                    CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
