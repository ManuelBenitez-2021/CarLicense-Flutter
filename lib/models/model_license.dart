class LicenseModel {
  String registration_number;
  String status;
  String status_date;
  String type;
  String use;
  String first_registration;
  String vin;
  String total_weight;
  String axels;
  String pulling_axels;
  String seats;
  String doors;
  String make;
  String model;
  String variant;
  String model_type;
  String model_year;
  String color;
  String chassis_type;
  String engine_cylinders;
  String engine_power;
  String fuel_type;
  String registration_zipcode;
  String vehicle_id;
  String batch_id;

  LicenseModel({this.registration_number, this.status, this.status_date
    , this.type, this.use, this.first_registration
    , this.vin, this.total_weight, this.axels
    , this.pulling_axels, this.seats, this.doors
    , this.make, this.model, this.variant
    , this.model_type, this.model_year, this.color
    , this.chassis_type, this.engine_cylinders, this.engine_power
    , this.fuel_type, this.registration_zipcode, this.vehicle_id
    , this.batch_id,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      registration_number : json['registration_number'] as String,
      status : json['status'] as String,
      status_date : json['status_date'] as String,
      type : json['type'] as String,
      use : json['use'] as String,
      first_registration : json['first_registration'] as String,
      vin : json['vin'] as String,
      total_weight : json['total_weight'] as String,
      axels : json['axels'] as String,
      pulling_axels : json['pulling_axels'] as String,
      seats : json['seats'] as String,
      doors : json['doors'] as String,
      make : json['make'] as String,
      model : json['model'] as String,
      variant : json['variant'] as String,
      model_type : json['model_type'] as String,
      model_year : json['model_year'] as String,
      color : json['color'] as String,
      chassis_type : json['chassis_type'] as String,
      engine_cylinders : json['engine_cylinders'] as String,
      engine_power : json['engine_power'] as String,
      fuel_type : json['fuel_type'] as String,
      registration_zipcode : json['registration_zipcode'] as String,
      vehicle_id : json['vehicle_id'] as String,
      batch_id : json['batch_id'] as String,
    );
  }

}