import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Notes extends ChangeNotifier {
  static const _storeKey = "notes";

  List<String> notes = [];

  Notes() {
    _load();
  }

  void _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_storeKey, jsonEncode(notes));
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final notesString = prefs.getString(_storeKey);
    if (notesString != null) {
      final decoded = jsonDecode(notesString) as List<dynamic>;
      notes = decoded.map((e) => e as String).toList();
    }
    notifyListeners();
  }

  void addNote(String note) {
    notes.add(note);
    _save();
    notifyListeners();
  }

  void removeNote(int index) {
    notes.removeAt(index);
    _save();
    notifyListeners();
  }

  void editNote(int index, String note) {
    notes[index] = note;
    _save();
    notifyListeners();
  }
}
