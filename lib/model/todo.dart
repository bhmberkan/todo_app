class Todo{
  
Todo({
  required this.id,
  required this.todo,
  required this.completed,
  required this.userId,
});


  int? id; 
  String? todo;
  bool? completed;
  int? userId;
  // apiden boş istek donerse diye nullable

  // From json
  Todo.fromJson(Map<String,dynamic> json){
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  // To json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data ={};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userId;

    return data;
  }

  // asp.net mapping ve reverse mapping işlemi aslında.
  // Json to dart web sitesinde otomatik olarak bu işlemi yapıyor aslında onu da kullanabiliriz.
  // elle yazmaktansa
}