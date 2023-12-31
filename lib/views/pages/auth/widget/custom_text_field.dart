import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function? onTap;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final double prefixSize;
  final bool divider;
  final TextAlign textAlign;

  const CustomTextField(
      {super.key,
      this.hintText = 'Write something...',
      required this.controller,
      this.focusNode,
      this.readOnly = false,
      this.nextFocus,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onTap,
      this.onChanged,
      this.prefixIcon,
      this.capitalization = TextCapitalization.none,
      this.isPassword = false,
      this.prefixSize = 8,
      this.divider = false,
      this.textAlign = TextAlign.start});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscuringCharacter: '*',
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap != null
              ? () {
                  widget.onTap!();
                }
              : null,
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          // inputFormatters: widget.inputType == TextInputType.phone
          //     ? <TextInputFormatter>[
          //         FilteringTextInputFormatter.allow(
          //             RegExp(r'^\d{3}-\d{4}-\d{4}$')),
          //       ]
          //     : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle:
                TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.prefixSize),
                    child: Image.asset(
                      widget.prefixIcon!,
                      height: 10,
                      width: 10,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                    onPressed: _toggle,
                  )
                : null,
          ),
        ),
        widget.divider
            ? const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Divider())
            : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
