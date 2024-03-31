class SliderModel{

  SliderData? data;
  String? message;
  List? error;
  int? status;

  SliderModel({this.data,this.message,this.error,this.status});

  SliderModel.fromJson(Map<String,dynamic> json)
  {
    data=json["data"]!=null ? SliderData.fromJson(json["data"]):null;
    message=json["message"];
    if(json["error"] != null)
      {
        for(var i in json["error"])
          {
            error!.add(i);
          }
      }
    status = json["json"];
  }

}

class SliderData{

  List<Sliders> sliderList = [];

  SliderData({required this.sliderList});

  SliderData.fromJson(Map<String,dynamic> json)
  {
    for(var i in json["sliders"])
      {
        sliderList.add(Sliders.fromJson(i));
      }
  }

}

class Sliders{
    String? image;
    Sliders({this.image});

    Sliders.fromJson(Map<String,dynamic> json)
    {
      image = json["image"];
    }
}