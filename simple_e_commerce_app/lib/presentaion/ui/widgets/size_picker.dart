import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key, required this.sizes, required this.onSizeSelected});

  final List<String> sizes;
  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.sizes.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        // cuscat operation
        Wrap(
            spacing: 8,
            children: widget.sizes.map((item) {
              return GestureDetector(
                onTap: () {
                  _selectedSize = item;
                  widget.onSizeSelected(item);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: _selectedSize == item? AppColors.themeColor: null,
                  ),
                  child: Text(item, style: TextStyle(
                    fontSize: 15,
                    color: _selectedSize == item? Colors.white: null,
                  ),)
                ),
              );
            }).toList())
      ],
    );
  }
}
