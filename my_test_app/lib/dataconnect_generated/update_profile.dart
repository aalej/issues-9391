part of 'default.dart';

class UpdateProfileVariablesBuilder {
  String email;
  String firstName;
  String lastName;
  Optional<String> _phone = Optional.optional(nativeFromJson, nativeToJson);
  Optional<List<Role>> _roles = Optional.optional(listDeserializer((data) => Role.values.byName(data)), listSerializer(enumSerializer));

  final FirebaseDataConnect _dataConnect;  UpdateProfileVariablesBuilder phone(String? t) {
   _phone.value = t;
   return this;
  }
  UpdateProfileVariablesBuilder roles(List<Role>? t) {
   _roles.value = t;
   return this;
  }

  UpdateProfileVariablesBuilder(this._dataConnect, {required  this.email,required  this.firstName,required  this.lastName,});
  Deserializer<UpdateProfileData> dataDeserializer = (dynamic json)  => UpdateProfileData.fromJson(jsonDecode(json));
  Serializer<UpdateProfileVariables> varsSerializer = (UpdateProfileVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateProfileData, UpdateProfileVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateProfileData, UpdateProfileVariables> ref() {
    UpdateProfileVariables vars= UpdateProfileVariables(email: email,firstName: firstName,lastName: lastName,phone: _phone,roles: _roles,);
    return _dataConnect.mutation("UpdateProfile", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateProfileMemberUpsert {
  final String id;
  UpdateProfileMemberUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateProfileMemberUpsert otherTyped = other as UpdateProfileMemberUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateProfileMemberUpsert({
    required this.id,
  });
}

@immutable
class UpdateProfileData {
  final UpdateProfileMemberUpsert member_upsert;
  UpdateProfileData.fromJson(dynamic json):
  
  member_upsert = UpdateProfileMemberUpsert.fromJson(json['member_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateProfileData otherTyped = other as UpdateProfileData;
    return member_upsert == otherTyped.member_upsert;
    
  }
  @override
  int get hashCode => member_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['member_upsert'] = member_upsert.toJson();
    return json;
  }

  UpdateProfileData({
    required this.member_upsert,
  });
}

@immutable
class UpdateProfileVariables {
  final String email;
  final String firstName;
  final String lastName;
  late final Optional<String>phone;
  late final Optional<List<Role>>roles;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateProfileVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']),
  firstName = nativeFromJson<String>(json['firstName']),
  lastName = nativeFromJson<String>(json['lastName']) {
  
  
  
  
  
    phone = Optional.optional(nativeFromJson, nativeToJson);
    phone.value = json['phone'] == null ? null : nativeFromJson<String>(json['phone']);
  
  
    roles = Optional.optional(listDeserializer((data) => Role.values.byName(data)), listSerializer(enumSerializer));
    roles.value = json['roles'] == null ? null : (json['roles'] as List<dynamic>)
        .map((e) => Role.fromJson(e))
        .toList();
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateProfileVariables otherTyped = other as UpdateProfileVariables;
    return email == otherTyped.email && 
    firstName == otherTyped.firstName && 
    lastName == otherTyped.lastName && 
    phone == otherTyped.phone && 
    roles == otherTyped.roles;
    
  }
  @override
  int get hashCode => Object.hashAll([email.hashCode, firstName.hashCode, lastName.hashCode, phone.hashCode, roles.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['firstName'] = nativeToJson<String>(firstName);
    json['lastName'] = nativeToJson<String>(lastName);
    if(phone.state == OptionalState.set) {
      json['phone'] = phone.toJson();
    }
    if(roles.state == OptionalState.set) {
      json['roles'] = roles.toJson();
    }
    return json;
  }

  UpdateProfileVariables({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.roles,
  });
}

