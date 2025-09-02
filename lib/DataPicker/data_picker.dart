import 'dart:io';

abstract class DataPicker
{
  Future<File?> pickData();
}