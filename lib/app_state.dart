import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _pagina = await secureStorage.getString('ff_pagina') ?? _pagina;
    });
    await _safeInitAsync(() async {
      _login = await secureStorage.getBool('ff_login') ?? _login;
    });
    await _safeInitAsync(() async {
      _agregarLista =
          await secureStorage.getBool('ff_agregarLista') ?? _agregarLista;
    });
    await _safeInitAsync(() async {
      _agregarRango =
          await secureStorage.getBool('ff_agregarRango') ?? _agregarRango;
    });
    await _safeInitAsync(() async {
      _coloniasOrigen =
          await secureStorage.getStringList('ff_coloniasOrigen') ??
              _coloniasOrigen;
    });
    await _safeInitAsync(() async {
      _coloniasDestino =
          await secureStorage.getStringList('ff_coloniasDestino') ??
              _coloniasDestino;
    });
    await _safeInitAsync(() async {
      _validacionZonaExtendida =
          await secureStorage.getString('ff_validacionZonaExtendida') ??
              _validacionZonaExtendida;
    });
    await _safeInitAsync(() async {
      _nombrePlataforma =
          await secureStorage.getString('ff_nombrePlataforma') ??
              _nombrePlataforma;
    });
    await _safeInitAsync(() async {
      _version = await secureStorage.getString('ff_version') ?? _version;
    });
    await _safeInitAsync(() async {
      _asignarlista =
          await secureStorage.getBool('ff_asignarlista') ?? _asignarlista;
    });
    await _safeInitAsync(() async {
      _guardarDatosBancarios =
          await secureStorage.getBool('ff_guardarDatosBancarios') ??
              _guardarDatosBancarios;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_origen') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_origen') ?? '{}';
          _origen = OriginAttributesStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _origenAgregado =
          await secureStorage.getBool('ff_origenAgregado') ?? _origenAgregado;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_destino') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_destino') ?? '{}';
          _destino = DestinationAttributesStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _destinoAgregado =
          await secureStorage.getBool('ff_destinoAgregado') ?? _destinoAgregado;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_paquete') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_paquete') ?? '{}';
          _paquete =
              ParcelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _paqueteAgregado =
          await secureStorage.getBool('ff_paqueteAgregado') ?? _paqueteAgregado;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _pagina = '';
  String get pagina => _pagina;
  set pagina(String _value) {
    _pagina = _value;
    secureStorage.setString('ff_pagina', _value);
  }

  void deletePagina() {
    secureStorage.delete(key: 'ff_pagina');
  }

  bool _login = true;
  bool get login => _login;
  set login(bool _value) {
    _login = _value;
    secureStorage.setBool('ff_login', _value);
  }

  void deleteLogin() {
    secureStorage.delete(key: 'ff_login');
  }

  bool _agregarLista = false;
  bool get agregarLista => _agregarLista;
  set agregarLista(bool _value) {
    _agregarLista = _value;
    secureStorage.setBool('ff_agregarLista', _value);
  }

  void deleteAgregarLista() {
    secureStorage.delete(key: 'ff_agregarLista');
  }

  bool _agregarRango = false;
  bool get agregarRango => _agregarRango;
  set agregarRango(bool _value) {
    _agregarRango = _value;
    secureStorage.setBool('ff_agregarRango', _value);
  }

  void deleteAgregarRango() {
    secureStorage.delete(key: 'ff_agregarRango');
  }

  List<String> _coloniasOrigen = ['Ingrese el CP de origen'];
  List<String> get coloniasOrigen => _coloniasOrigen;
  set coloniasOrigen(List<String> _value) {
    _coloniasOrigen = _value;
    secureStorage.setStringList('ff_coloniasOrigen', _value);
  }

  void deleteColoniasOrigen() {
    secureStorage.delete(key: 'ff_coloniasOrigen');
  }

  void addToColoniasOrigen(String _value) {
    _coloniasOrigen.add(_value);
    secureStorage.setStringList('ff_coloniasOrigen', _coloniasOrigen);
  }

  void removeFromColoniasOrigen(String _value) {
    _coloniasOrigen.remove(_value);
    secureStorage.setStringList('ff_coloniasOrigen', _coloniasOrigen);
  }

  void removeAtIndexFromColoniasOrigen(int _index) {
    _coloniasOrigen.removeAt(_index);
    secureStorage.setStringList('ff_coloniasOrigen', _coloniasOrigen);
  }

  void updateColoniasOrigenAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _coloniasOrigen[_index] = updateFn(_coloniasOrigen[_index]);
    secureStorage.setStringList('ff_coloniasOrigen', _coloniasOrigen);
  }

  List<String> _coloniasDestino = [];
  List<String> get coloniasDestino => _coloniasDestino;
  set coloniasDestino(List<String> _value) {
    _coloniasDestino = _value;
    secureStorage.setStringList('ff_coloniasDestino', _value);
  }

  void deleteColoniasDestino() {
    secureStorage.delete(key: 'ff_coloniasDestino');
  }

  void addToColoniasDestino(String _value) {
    _coloniasDestino.add(_value);
    secureStorage.setStringList('ff_coloniasDestino', _coloniasDestino);
  }

  void removeFromColoniasDestino(String _value) {
    _coloniasDestino.remove(_value);
    secureStorage.setStringList('ff_coloniasDestino', _coloniasDestino);
  }

  void removeAtIndexFromColoniasDestino(int _index) {
    _coloniasDestino.removeAt(_index);
    secureStorage.setStringList('ff_coloniasDestino', _coloniasDestino);
  }

  void updateColoniasDestinoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _coloniasDestino[_index] = updateFn(_coloniasDestino[_index]);
    secureStorage.setStringList('ff_coloniasDestino', _coloniasDestino);
  }

  String _validacionZonaExtendida = 'Es zona extendida';
  String get validacionZonaExtendida => _validacionZonaExtendida;
  set validacionZonaExtendida(String _value) {
    _validacionZonaExtendida = _value;
    secureStorage.setString('ff_validacionZonaExtendida', _value);
  }

  void deleteValidacionZonaExtendida() {
    secureStorage.delete(key: 'ff_validacionZonaExtendida');
  }

  String _nombrePlataforma = 'EnviaY';
  String get nombrePlataforma => _nombrePlataforma;
  set nombrePlataforma(String _value) {
    _nombrePlataforma = _value;
    secureStorage.setString('ff_nombrePlataforma', _value);
  }

  void deleteNombrePlataforma() {
    secureStorage.delete(key: 'ff_nombrePlataforma');
  }

  String _version = '1.2.2';
  String get version => _version;
  set version(String _value) {
    _version = _value;
    secureStorage.setString('ff_version', _value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  bool _asignarlista = false;
  bool get asignarlista => _asignarlista;
  set asignarlista(bool _value) {
    _asignarlista = _value;
    secureStorage.setBool('ff_asignarlista', _value);
  }

  void deleteAsignarlista() {
    secureStorage.delete(key: 'ff_asignarlista');
  }

  bool _guardarDatosBancarios = false;
  bool get guardarDatosBancarios => _guardarDatosBancarios;
  set guardarDatosBancarios(bool _value) {
    _guardarDatosBancarios = _value;
    secureStorage.setBool('ff_guardarDatosBancarios', _value);
  }

  void deleteGuardarDatosBancarios() {
    secureStorage.delete(key: 'ff_guardarDatosBancarios');
  }

  OriginAttributesStruct _origen = OriginAttributesStruct();
  OriginAttributesStruct get origen => _origen;
  set origen(OriginAttributesStruct _value) {
    _origen = _value;
    secureStorage.setString('ff_origen', _value.serialize());
  }

  void deleteOrigen() {
    secureStorage.delete(key: 'ff_origen');
  }

  void updateOrigenStruct(Function(OriginAttributesStruct) updateFn) {
    updateFn(_origen);
    secureStorage.setString('ff_origen', _origen.serialize());
  }

  bool _origenAgregado = false;
  bool get origenAgregado => _origenAgregado;
  set origenAgregado(bool _value) {
    _origenAgregado = _value;
    secureStorage.setBool('ff_origenAgregado', _value);
  }

  void deleteOrigenAgregado() {
    secureStorage.delete(key: 'ff_origenAgregado');
  }

  DestinationAttributesStruct _destino = DestinationAttributesStruct();
  DestinationAttributesStruct get destino => _destino;
  set destino(DestinationAttributesStruct _value) {
    _destino = _value;
    secureStorage.setString('ff_destino', _value.serialize());
  }

  void deleteDestino() {
    secureStorage.delete(key: 'ff_destino');
  }

  void updateDestinoStruct(Function(DestinationAttributesStruct) updateFn) {
    updateFn(_destino);
    secureStorage.setString('ff_destino', _destino.serialize());
  }

  bool _destinoAgregado = false;
  bool get destinoAgregado => _destinoAgregado;
  set destinoAgregado(bool _value) {
    _destinoAgregado = _value;
    secureStorage.setBool('ff_destinoAgregado', _value);
  }

  void deleteDestinoAgregado() {
    secureStorage.delete(key: 'ff_destinoAgregado');
  }

  ParcelStruct _paquete = ParcelStruct();
  ParcelStruct get paquete => _paquete;
  set paquete(ParcelStruct _value) {
    _paquete = _value;
    secureStorage.setString('ff_paquete', _value.serialize());
  }

  void deletePaquete() {
    secureStorage.delete(key: 'ff_paquete');
  }

  void updatePaqueteStruct(Function(ParcelStruct) updateFn) {
    updateFn(_paquete);
    secureStorage.setString('ff_paquete', _paquete.serialize());
  }

  bool _paqueteAgregado = false;
  bool get paqueteAgregado => _paqueteAgregado;
  set paqueteAgregado(bool _value) {
    _paqueteAgregado = _value;
    secureStorage.setBool('ff_paqueteAgregado', _value);
  }

  void deletePaqueteAgregado() {
    secureStorage.delete(key: 'ff_paqueteAgregado');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
