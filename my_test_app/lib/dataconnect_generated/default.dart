library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'update_profile.dart';

part 'list_everything.dart';



  enum Role {
    
      ADMIN,
    
      ADJUSTER,
    
      MANAGER,
    
      DEVELOPER,
    
  }
  
  String roleSerializer(EnumValue<Role> e) {
    return e.stringValue;
  }
  EnumValue<Role> roleDeserializer(dynamic data) {
    switch (data) {
      
      case 'ADMIN':
        return const Known(Role.ADMIN);
      
      case 'ADJUSTER':
        return const Known(Role.ADJUSTER);
      
      case 'MANAGER':
        return const Known(Role.MANAGER);
      
      case 'DEVELOPER':
        return const Known(Role.DEVELOPER);
      
      default:
        return Unknown(data);
    }
  }
  



String enumSerializer(Enum e) {
  return e.name;
}



/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class DefaultConnector {
  
  
  UpdateProfileVariablesBuilder updateProfile ({required String email, required String firstName, required String lastName, }) {
    return UpdateProfileVariablesBuilder(dataConnect, email: email,firstName: firstName,lastName: lastName,);
  }
  
  
  ListEverythingVariablesBuilder listEverything () {
    return ListEverythingVariablesBuilder(dataConnect, );
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'default',
    'test-dc-2',
  );

  DefaultConnector({required this.dataConnect});
  static DefaultConnector get instance {
    return DefaultConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

