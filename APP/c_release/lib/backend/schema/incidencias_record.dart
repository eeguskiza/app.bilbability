import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'incidencias_record.g.dart';

abstract class IncidenciasRecord
    implements Built<IncidenciasRecord, IncidenciasRecordBuilder> {
  static Serializer<IncidenciasRecord> get serializer =>
      _$incidenciasRecordSerializer;

  String? get titulo;

  String? get resumen;

  String? get foto;

  LatLng? get ubicacion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IncidenciasRecordBuilder builder) => builder
    ..titulo = ''
    ..resumen = ''
    ..foto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('incidencias');

  static Stream<IncidenciasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IncidenciasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IncidenciasRecord._();
  factory IncidenciasRecord([void Function(IncidenciasRecordBuilder) updates]) =
      _$IncidenciasRecord;

  static IncidenciasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIncidenciasRecordData({
  String? titulo,
  String? resumen,
  String? foto,
  LatLng? ubicacion,
}) {
  final firestoreData = serializers.toFirestore(
    IncidenciasRecord.serializer,
    IncidenciasRecord(
      (i) => i
        ..titulo = titulo
        ..resumen = resumen
        ..foto = foto
        ..ubicacion = ubicacion,
    ),
  );

  return firestoreData;
}
