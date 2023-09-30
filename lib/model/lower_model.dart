class LowerNewsModel{
  String? image;
  String? url;
  String? author;
  String? title;
  String? description;
  String? content;
  String? tag;

  LowerNewsModel( 
    {
      required this.image,
      required this.url,
      required this.author,
      required this.title,
      required this.description,
      required this.content,
      this.tag
      }
      );
}