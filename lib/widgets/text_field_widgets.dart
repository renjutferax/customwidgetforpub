library;

import 'package:flutter/material.dart';

class ThreeTextFieldsWidget extends StatefulWidget {
  final int indexInParent;
  final Map<String, TextEditingController> controller;

  const ThreeTextFieldsWidget({
    super.key,
    required this.indexInParent,
    required this.controller,
  });

  @override
  State<ThreeTextFieldsWidget> createState() => _ThreeTextFieldsWidgetState();
}

class _ThreeTextFieldsWidgetState extends State<ThreeTextFieldsWidget> {
  @override
  @override
  void initState() {
    super.initState();

    widget.controller.putIfAbsent(
      'taxValueController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'hsnController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'salesPriceController-${widget.indexInParent}',
      () => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // widget.controller['taxValueController-${widget.indexInParent}']?.dispose();
    // widget.controller['hsnController-${widget.indexInParent}']?.dispose();
    // widget.controller['salesPriceController-${widget.indexInParent}']
    //     ?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: const Color.fromARGB(255, 222, 247, 255),
      ),
      child: Column(
        children: [
          TextField(
            controller:
                widget.controller['taxValueController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'TaxValue'),
          ),
          TextField(
            controller:
                widget.controller['hsnController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'HSN'),
          ),
          TextField(
            controller:
                widget
                    .controller['salesPriceController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'SalesPrice'),
          ),
        ],
      ),
    );
  }
}

class SixTextFieldsWidget extends StatefulWidget {
  final int indexInParent;
  final Map<String, TextEditingController> controller;

  const SixTextFieldsWidget({
    super.key,
    required this.indexInParent,
    required this.controller,
  });

  @override
  State<SixTextFieldsWidget> createState() => _SixTextFieldsWidgetState();
}

class _SixTextFieldsWidgetState extends State<SixTextFieldsWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.putIfAbsent(
      'lengthController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'heightController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'areaController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'taxValueController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'hsnController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'salesPriceController-${widget.indexInParent}',
      () => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // widget.controller['lengthController-${widget.indexInParent}']?.dispose();
    // widget.controller['heightController-${widget.indexInParent}']?.dispose();
    // widget.controller['areaController-${widget.indexInParent}']?.dispose();
    // widget.controller['taxValueController-${widget.indexInParent}']?.dispose();
    // widget.controller['hsnController-${widget.indexInParent}']?.dispose();
    // widget.controller['salesPriceController-${widget.indexInParent}']
    //     ?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: const Color.fromARGB(255, 226, 225, 222),
      ),
      child: Column(
        children: [
          TextField(
            controller:
                widget.controller['lengthController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Length'),
          ),
          TextField(
            controller:
                widget.controller['heightController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Height'),
          ),
          TextField(
            controller:
                widget.controller['areaController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Area'),
          ),
          TextField(
            controller:
                widget.controller['taxValueController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'TaxValue'),
          ),
          TextField(
            controller:
                widget.controller['hsnController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'HSN'),
          ),
          TextField(
            controller:
                widget
                    .controller['salesPriceController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'SalesPrice'),
          ),
        ],
      ),
    );
  }
}

class ComplexFormWidget extends StatefulWidget {
  final int indexInParent;
  final Map<String, TextEditingController> controller;
  final Map<String, String> fieldcontroller;

  ComplexFormWidget({
    super.key,
    required this.indexInParent,
    required this.controller,
    required this.fieldcontroller,
  });

  @override
  State<ComplexFormWidget> createState() => _ComplexFormWidgetState();
}

class _ComplexFormWidgetState extends State<ComplexFormWidget> {
  bool checkboxValue = false;
  String radioValue = 'Option1';
  String dropdownValue = 'Choice1';

  final List<String> dropdownItems = ['Choice1', 'Choice2', 'Choice3'];

  @override
  void initState() {
    super.initState();
    widget.controller.putIfAbsent(
      'lengthController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'heightController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'areaController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'taxValueController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'hsnController-${widget.indexInParent}',
      () => TextEditingController(),
    );
    widget.controller.putIfAbsent(
      'salesPriceController-${widget.indexInParent}',
      () => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // widget.controller['lengthController-${widget.indexInParent}']?.dispose();
    // widget.controller['heightController-${widget.indexInParent}']?.dispose();
    // widget.controller['areaController-${widget.indexInParent}']?.dispose();
    // widget.controller['taxValueController-${widget.indexInParent}']?.dispose();
    // widget.controller['hsnController-${widget.indexInParent}']?.dispose();
    // widget.controller['salesPriceController-${widget.indexInParent}']
    //     ?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Select option: '),
              Radio<String>(
                value: 'Option1',
                groupValue: radioValue,
                onChanged: (val) => setState(() => radioValue = val!),
              ),
              const Text('Option 1'),
              Radio<String>(
                value: 'Option2',
                groupValue: radioValue,
                onChanged: (val) => setState(() => radioValue = val!),
              ),
              const Text('Option 2'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: checkboxValue,
                onChanged: (val) => setState(() => checkboxValue = val!),
              ),
              const Text('Yes/No'),
            ],
          ),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (val) {
              setState(() {
                dropdownValue = val!;
              });
            },
            items:
                dropdownItems
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
          ),
          TextField(
            controller:
                widget.controller['lengthController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Length'),
          ),
          TextField(
            controller:
                widget.controller['heightController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Height'),
          ),
          TextField(
            controller:
                widget.controller['areaController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'Area'),
          ),
          TextField(
            controller:
                widget.controller['taxValueController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'TaxValue'),
          ),
          TextField(
            controller:
                widget.controller['hsnController-${widget.indexInParent}'],
            decoration: const InputDecoration(labelText: 'HSN'),
          ),
        ],
      ),
    );
  }
}
