/// This class defines the variables used in the [map_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MapModel {
  MapModel({required this.mapFrom, required this.mapTo});
  double mapFrom = 0;
  double mapTo = 0;
}
