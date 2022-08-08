import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class MakePayParams extends Equatable{
  Package package;
  BuildContext context;
  MakePayParams(this.package,this.context);
  @override
  List<Object?> get props => [context,package];
}