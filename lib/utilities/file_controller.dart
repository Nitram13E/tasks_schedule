import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileController {
  static final FileController _instance = FileController._internal();
  File? file;

  FileController._internal();

  factory FileController() => _instance;

  void loadFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      lockParentWindow: true,
    );

    if (filePickerResult != null) file = File(filePickerResult.files.single.path!);
  }

  void writeJson(Map<dynamic, dynamic> json) async {
    JsonEncoder jsonEncoder = const JsonEncoder.withIndent("\t");

    Uint8List newFile = Uint8List.fromList(jsonEncoder.convert(json).codeUnits);

    if (file != null) {
      file?.writeAsBytesSync(newFile);
    } else {
      String? path = await FilePicker.platform.getDirectoryPath(lockParentWindow: true);

      if (path != null) {
        File json = File('$path\\notas.json');

        json.writeAsBytesSync(newFile);
      }
    }
  }
}
