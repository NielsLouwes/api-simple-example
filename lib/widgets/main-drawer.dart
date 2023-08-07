import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
    required this.menFilterUpdate,
    required this.womenFilterUpdate,
    required this.menFilterState,
    required this.womenFilterState,
  });

  final Function menFilterUpdate;
  final Function womenFilterUpdate;
  final bool menFilterState;
  final bool womenFilterState;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  var _menFilterSet = false;
  var _womenFilterSet = false;

  @override
  void initState() {
    super.initState();
    _menFilterSet = widget.menFilterState;
    _womenFilterSet = widget.womenFilterState;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Filters',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                ),
              ],
            ),
          ),
          SwitchListTile(
              value: _menFilterSet,
              onChanged: (isChecked) {
                // update men filterset
                setState(() {
                  _menFilterSet = isChecked;
                  widget.menFilterUpdate(isChecked);
                });
              },
              title: const Text('Men', style: TextStyle(fontSize: 22)),
              subtitle: const Text('Filter by men')),
          SwitchListTile(
            value: _womenFilterSet,
            onChanged: (isChecked) {
              // update women filterset
              setState(() {
                _womenFilterSet = isChecked;
                widget.womenFilterUpdate(isChecked);
              });
            },
            title: const Text('Women', style: TextStyle(fontSize: 22)),
            subtitle: const Text('Filter by women'),
          ),
        ],
      ),
    );
  }
}
