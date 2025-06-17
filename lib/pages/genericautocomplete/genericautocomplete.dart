

import 'package:flutter/material.dart';
import 'package:my_custom_widgets_ferax/pages/genericautocomplete/genericautocompleteconfig.dart';

class GenericAutocompletePage<T> extends StatefulWidget {
  final AutocompleteConfig<T> config;

  const GenericAutocompletePage({super.key, required this.config});

  @override
  State<GenericAutocompletePage<T>> createState() =>
      _GenericAutocompletePageState<T>();
}
class _GenericAutocompletePageState<T> extends State<GenericAutocompletePage<T>> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _textEditingController;
  List<T> options = [];
  int _currentPage = 1;
  final int pageSize = 20;
  bool _hasMore = true;
  bool isDropdownExpanded = false;
    bool _isLoading = false;
     

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchMoreData();
      }
    });
    _fetchMoreData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
  //  _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _fetchMoreData() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    try {
      final newItems = await widget.config.fetchItems(
        _textEditingController.text.trim(),
        _currentPage,
        pageSize,
      );

      setState(() {
        options.addAll(newItems);
        if (newItems.length < pageSize) {
          _hasMore = false;
        } else {
          _currentPage++;
        }
      });
    } finally {
      _isLoading = false;
    }
  }




  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Autocomplete<Object>(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text.trim().isEmpty) {
              options = [];
              _currentPage = 1;
              _hasMore = true;
            }

            final newItems = await widget.config.fetchItems(
              textEditingValue.text,
              _currentPage,pageSize
            );

            setState(() {
              options = newItems;
              if (newItems.length < pageSize) {
                _hasMore = false;
              }
            });

            return options.cast<Object>();
          },
          displayStringForOption: (Object option) => widget.config.displayStringForOption(option as T),
          onSelected: (Object selection) {
            widget.config.onSelected(widget.config.convertToMap(selection as T));
           
          },
          fieldViewBuilder: (context, controller, focusNode, _) {
            _textEditingController = controller;

            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration:  InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                   suffixIcon: SizedBox(
  width: 80,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {
          _textEditingController.clear();
          _currentPage = 1;
        },
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
),
                
              ),
              onChanged: (_) => _currentPage = 1,
              
            );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Material(
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(8),
               
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    if (isDropdownExpanded) _buildFieldSelector(),
                    const Divider(),
                    SizedBox(
                      height:500,
                      width:600,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: options.length + (_hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == options.length && _hasMore) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          final item = options.elementAt(index);
                          return InkWell(
                            onTap: () => onSelected(item),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: widget.config.fieldOrder
                                    .where((f) => widget.config.fieldVisibility[f]!)
                                    .map((f) => Expanded(
          flex: widget.config.fieldFlex[f] ?? 1,
          child: Text(widget.config.getFieldValue(item as T, f).toString()),
        ))
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    
    );
  }

                

Widget _buildHeader() {
  return Container(
    width: 600,
    height: 50,
    color: Colors.blueGrey[50],
    padding: const EdgeInsets.all(8),
    child: Stack(
      children: [
        Row(
          children: widget.config.fieldOrder
              .where((f) => widget.config.fieldVisibility[f]!)
              .map((f) => Expanded(
                    flex: widget.config.fieldFlex[f] ?? 1,
                    child: Text(
                      widget.config.fieldLabels[f]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              setState(() {
                isDropdownExpanded = !isDropdownExpanded;
              });
            },
          ),
        ),
      ],
    ),
  );
}


  Widget _buildFieldSelector() {
    return Container(
      height: 200,
      width:600,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[100],
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = widget.config.fieldOrder.removeAt(oldIndex);
            widget.config.fieldOrder.insert(newIndex, item);
          });
        },
        children: [
          for (final f in widget.config.fieldOrder)
            ListTile(
              key: ValueKey(f),
              title: Text(widget.config.fieldLabels[f]!),
              leading: Checkbox(
                value: widget.config.fieldVisibility[f],
                onChanged: (v) {
                  setState(() {
                    widget.config.fieldVisibility[f] = v!;
                  });
                },
              ),
              trailing: const Icon(Icons.drag_handle),
            ),
        ],
      ),
    );
  }
}

