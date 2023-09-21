import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'id_record.g.dart';

abstract class IdRecord implements Built<IdRecord, IdRecordBuilder> {
  static Serializer<IdRecord> get serializer => _$idRecordSerializer;

  @BuiltValueField(wireName: 'IDusuario')
  String? get iDusuario;

  @BuiltValueField(wireName: 'Localidad')
  String? get localidad;

  String? get descripcion;

  String? get numerotelefono;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IdRecordBuilder builder) => builder
    ..iDusuario = ''
    ..localidad = ''
    ..descripcion = ''
    ..numerotelefono = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ID');

  static Stream<IdRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IdRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IdRecord._();
  factory IdRecord([void Function(IdRecordBuilder) updates]) = _$IdRecord;

  static IdRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIdRecordData({
  String? iDusuario,
  String? localidad,
  String? descripcion,
  String? numerotelefono,
}) {
  final firestoreData = serializers.toFirestore(
    IdRecord.serializer,
    IdRecord(
      (i) => i
        ..iDusuario = iDusuario
        ..localidad = localidad
        ..descripcion = descripcion
        ..numerotelefono = numerotelefono,
    ),
  );

  return firestoreData;
}
