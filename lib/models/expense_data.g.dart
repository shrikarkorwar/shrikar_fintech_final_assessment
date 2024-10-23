// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseDataAdapter extends TypeAdapter<ExpenseData> {
  @override
  final int typeId = 0;

  @override
  ExpenseData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseData(
      date: fields[0] as String?,
      expenseTitle: fields[1] as String?,
      expenseAmount: fields[2] as String?,
      category: fields[3] as String?,
      expenseData: (fields[4] as List?)?.cast<ExpenseData>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.expenseTitle)
      ..writeByte(2)
      ..write(obj.expenseAmount)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.expenseData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
