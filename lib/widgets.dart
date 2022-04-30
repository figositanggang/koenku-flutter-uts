import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final children;

  const MyGridView({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      padding: EdgeInsets.symmetric(vertical: 8),
      childAspectRatio: (4 / 4),
      children: children,
    );
  }
}

class MyGVContainer extends StatelessWidget {
  final child;

  const MyGVContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.only(left: 8, right: 8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(.25),
          ),
        ],
      ),
    );
  }
}

class KeranjangButton extends StatelessWidget {
  final onPressed;

  const KeranjangButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.add_shopping_cart),
      tooltip: "Keranjang",
    );
  }
}

class BeliButton extends StatelessWidget {
  final onPressed;

  const BeliButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(Icons.attach_money),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
      ),
    );
  }
}

class BNTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  var border;
  var keyBoardType;
  var inputFormatter;
  var errorText;
  var enabled;

  BNTextField({
    Key? key,
    required this.controller,
    required this.label,
    InputBorder? this.border,
    TextInputType? this.keyBoardType,
    this.inputFormatter,
    this.errorText,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      inputFormatters: inputFormatter,
      enabled: enabled,
      decoration: InputDecoration(
        label: Text(label),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        errorText: errorText,
        border: border,
      ),
    );
  }
}

class BNRadioLT extends StatelessWidget {
  final title;
  final value;
  final grupValue;
  final onChanged;
  final selected;

  const BNRadioLT({
    Key? key,
    required this.title,
    required this.value,
    required this.grupValue,
    required this.onChanged,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: title,
      onChanged: onChanged,
      value: value,
      groupValue: grupValue,
      selected: selected,
    );
  }
}
