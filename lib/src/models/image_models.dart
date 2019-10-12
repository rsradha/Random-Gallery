class ImageModel {
   //int id;
   String url;
   String title;
  

  
  //ImageModel(this.id, this.url, this.title);
  ImageModel(this.url);
  ImageModel.fromJson(Map<String, dynamic> parsedJson){
   // id  = parsedJson['id'];
    url = parsedJson['download_url'];
    title = parsedJson['author'];
  }
}