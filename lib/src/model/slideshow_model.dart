import 'package:flutter/material.dart';

class SlideshowModel with ChangeNotifier{
  double _primarySize, _secondarySize;
  Color _primaryColor, _secondaryColor;

  // Getter
  double get primarySize => this._primarySize;
  double get secondarySize => this._secondarySize;
  Color get primaryColor => this._primaryColor;
  Color get secondaryColor => this._secondaryColor;

  // Setter
  set primarySize(double pSize){
    this._primarySize = pSize;
  }
  set secondarySize(double sSize){
    this._secondarySize = sSize;
  }
  set primaryColor(Color pColor){
    this._primaryColor = pColor;
  }
  set secondaryColor(Color sColor){
    this._secondaryColor = sColor;
  }
}
