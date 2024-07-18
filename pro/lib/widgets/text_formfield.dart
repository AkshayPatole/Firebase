import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final GlobalKey<FormState>? formFieldKey;
  final String labelText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? cursorColor;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Color? hintColor;
  final String? initialValue;
  final BoxConstraints? constraints;
  final InputBorder? border;
  final double? cursorheight;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enabled;
  final bool? readOnly;
  final Function(PointerDownEvent)? onOutSideTap;
  const CustomTextFormFieldWidget({
    Key? key,
    required this.labelText,
    this.hintStyle,
    this.suffixIcon,
    this.formFieldKey,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.cursorColor,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.hintColor,
    this.initialValue,
    this.constraints,
    this.border,
    this.cursorheight,
    this.prefixIcon,
    this.autovalidateMode,
    this.focusNode,
    this.autofocus,
    this.onOutSideTap,
    this.backgroundColor,
    this.enabled,
    this.readOnly,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.inputFormatters,
        cursorColor: Colors.black,
        focusNode: focusNode,
        autofocus: widget.autofocus ?? false,
        cursorHeight: widget.cursorheight,
        enabled: widget.enabled,
        decoration: InputDecoration(
            border: widget.border ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
            focusedBorder: widget.border ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
            labelText: widget.labelText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.all(10)),
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        style: TextStyle(
          fontSize: focusNode.hasFocus ? 14.sp : 16.sp,
          fontWeight: FontWeight.w600,
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: widget.onOutSideTap,
      ),
    );
  }
}
