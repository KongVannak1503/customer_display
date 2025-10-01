import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomSelectFieldWidget<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Icon? icon;

  const CustomSelectFieldWidget({
    super.key,
    required this.label,
    required this.items,
    this.icon,
    this.selectedItem,
    this.itemAsString,
    this.onChanged,
    this.validator,
  });

  @override
  State<CustomSelectFieldWidget<T>> createState() =>
      _CustomSelectFieldWidgetState<T>();
}

class _CustomSelectFieldWidgetState<T>
    extends State<CustomSelectFieldWidget<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where(
            (item) => (widget.itemAsString?.call(item) ?? item.toString())
                .toLowerCase()
                .contains(searchText),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4);
    final borderColor = Theme.of(context).colorScheme.inversePrimary;
    final bgColor = Theme.of(context).colorScheme.primaryContainer;

    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        value: widget.selectedItem,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.icon ?? const Icon(Icons.store_outlined, size: 25),
          border: OutlineInputBorder(borderRadius: borderRadius),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 0,
          ),
          filled: true,
          fillColor: bgColor,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(27, 31, 35, 0.04),
                blurRadius: 0,
                spreadRadius: 0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: _searchController,
          searchInnerWidgetHeight: 200,
          searchInnerWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select ${widget.label}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Icon(Icons.search, size: 25),
                    hintText: 'Search...',
                    border: OutlineInputBorder(borderRadius: borderRadius),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: BorderSide(color: borderColor, width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: BorderSide(color: borderColor, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Show message only if no items
                if (_filteredItems.isEmpty)
                  Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          searchMatchFn: (item, searchValue) {
            final itemLabel =
                widget.itemAsString?.call(item.value as T) ??
                item.value.toString();
            return itemLabel.toLowerCase().contains(searchValue.toLowerCase());
          },
        ),

        onMenuStateChange: (isOpen) {
          if (!isOpen) _searchController.clear();
        },
        items: _filteredItems.map<DropdownMenuItem<T>>((T item) {
          final itemLabel = widget.itemAsString?.call(item) ?? item.toString();
          return DropdownMenuItem<T>(
            value: item,
            child: Text(itemLabel, overflow: TextOverflow.ellipsis),
          );
        }).toList(),
      ),
    );
  }
}
