import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String? name;
  final String? id;
  final String? docId;
  const Brand({this.name, this.id, this.docId});

  @override
  List<Object?> get props => [name, id];

 
}
