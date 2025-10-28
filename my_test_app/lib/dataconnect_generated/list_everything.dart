part of 'default.dart';

class ListEverythingVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListEverythingVariablesBuilder(this._dataConnect, );
  Deserializer<ListEverythingData> dataDeserializer = (dynamic json)  => ListEverythingData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListEverythingData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListEverythingData, void> ref() {
    
    return _dataConnect.query("ListEverything", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListEverythingMembers {
  final String email;
  ListEverythingMembers.fromJson(dynamic json):
  
  email = nativeFromJson<String>(json['email']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListEverythingMembers otherTyped = other as ListEverythingMembers;
    return email == otherTyped.email;
    
  }
  @override
  int get hashCode => email.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  ListEverythingMembers({
    required this.email,
  });
}

@immutable
class ListEverythingData {
  final List<ListEverythingMembers> members;
  ListEverythingData.fromJson(dynamic json):
  
  members = (json['members'] as List<dynamic>)
        .map((e) => ListEverythingMembers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListEverythingData otherTyped = other as ListEverythingData;
    return members == otherTyped.members;
    
  }
  @override
  int get hashCode => members.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['members'] = members.map((e) => e.toJson()).toList();
    return json;
  }

  ListEverythingData({
    required this.members,
  });
}

