import 'package:flutter/material.dart';


class Category {

  final int id;
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor
  });
  
  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id:   json['id'], 
    name: json['name'], 
    icon: IconData(json['icon'], fontFamily: 'MaterialIcons'), 
    iconColor: Color(json['iconColor']), 
    backgroundColor: Color(json[ 'backgroundColor'])
  );

} 