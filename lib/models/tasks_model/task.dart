class Task {
  int id;
  bool completed;
  String title;
  String description;
  String dueDate;

  Task({this.id, this.completed, this.title, this.description,this.dueDate});


  factory Task.FromJson(Map<String,dynamic> parsedJson){
    return Task(
      title: parsedJson["title"],
      description: parsedJson["description"],
      dueDate: parsedJson["dueDate"],
      completed: parsedJson["completed"],
    );
  }
  Map<String,dynamic>toMap(){
    return {
      "title":title,
      "description":description,
      "dueDate":dueDate,
      "completed":completed,
    };
  }
  
  
  static List<Task> getDemoTaskList(){
    return [
      Task(id: 1,title: "Продать квартиру № 5",description: "Квартира №5 , распаложен на 5м этаже, 42 м2,",dueDate: "30.06.2020"),
      Task(id: 2,title: "Заключить договор с ОсОО ",description: "Встреча назначена на утро 29.06.2020 г.Ош ул.Ленина 36",dueDate: "30.06.2020"),
      Task(id: 3,title: "Ввести переговоры с поставщиками ",description: "Поставщики строительных материалов, Адрес г.Ош ул.Гагарина 1059",dueDate: "05.07.2020"),
      Task(id: 4,title: "Провести тендер ",description: "Провести тендер для всех компании которые занимаются продажей бетона, Дата проведения:10.07.2020",dueDate: "10.07.2020"),
    ];
  }


}