import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final List menuItems;
  const DropDownMenu(this.menuItems, {super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  var _dropDownValue;
  void dropDownCallBack(selectedValue) {
    if (selectedValue != null) {
      setState(() {
        _dropDownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: dropDownCallBack,
      value: _dropDownValue,
      isExpanded: true,
      hint: const Text('Pick a location'),
      items: widget.menuItems.map((itemData) {
        // print(itemData);
        return DropdownMenuItem<String?>(
          value: itemData['name'],
          child: Text(
            itemData['name'],
          ),
        );
      }).toList(),
    );
  }
}
