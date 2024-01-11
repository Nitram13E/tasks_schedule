import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class FileController {
  static final FileController _instance = FileController._internal();
  final DaysController daysController = DaysController();
  File? file;

  FileController._internal();

  factory FileController() => _instance;

  void loadFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      lockParentWindow: true,
    );

    if (filePickerResult != null) file = File(filePickerResult.files.single.path!);

    if (file != null) {
      file!
          .readAsString()
          .then((fileContent) => daysController.loadfromJson(json: jsonDecode(fileContent)))
          .onError((error, stackTrace) => debugPrint(error.toString()));
    }
  }

  void writeFile() async {
    JsonEncoder jsonEncoder = const JsonEncoder.withIndent("\t");
    String json = jsonEncoder.convert(daysController);

    if (file != null) {
      IOSink ioSink = file!.openWrite(mode: FileMode.write, encoding: utf8);

      ioSink.write(json);
      ioSink.close();
    } else {
      String? path = await FilePicker.platform.saveFile(
        lockParentWindow: true,
        dialogTitle: 'Save notes',
        fileName: 'Notes.schedule',
        type: FileType.custom,
        allowedExtensions: ['schedule'],
      );

      if (path != null) {
        File newFile = File(path);
        IOSink ioSink = newFile.openWrite(mode: FileMode.write, encoding: utf8);

        ioSink.write(json);
        ioSink.close();
      }
    }
  }
}
