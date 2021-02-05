class Band {
  String id;
  String name;
  int votes;

  //Constrcutor
  Band({
    this.id,
    this.name,
    this.votes,
  });

  //Constructor que recibe argumentos y regresa una nueva instancia
  factory Band.fromMap(Map<String, dynamic> obj) => 
  Band(
    id    : obj['id'],
    name  : obj['name'],
    votes : obj['votes'],
  );


}
