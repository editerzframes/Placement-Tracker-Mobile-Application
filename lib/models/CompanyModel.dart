class CompanyModel {
  final dynamic name;
  final dynamic tenth;
  final dynamic twelfth;
  final dynamic graduation;
  final dynamic backlogs;
  final dynamic ctc;
  final dynamic arrival;
  final dynamic link;
  final dynamic details;
  CompanyModel(
      {
      this.name,
      this.details,
      this.tenth,
      this.twelfth,
      this.arrival,
      this.backlogs,
      this.ctc,
      this.graduation,
      this.link
      });
  Map<String,dynamic> toMap() {
   return {
     "name":name,
    "details":details,
    "tenth":tenth,
    "twelfth":twelfth,
    "arrival":arrival,
    "backlogs":backlogs,
    "ctc":ctc,
    "graduation":graduation,
    "link":link
    }; 
  }
}
