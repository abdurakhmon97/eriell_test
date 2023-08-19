import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'credentials_hive_object.g.dart';

@HiveType(typeId: 0)
class CredentialsHiveObject extends HiveObject with EquatableMixin {
  CredentialsHiveObject({
    required this.username,
    required this.password,
  });

  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
