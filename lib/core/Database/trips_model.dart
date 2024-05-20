class TripsModel {
  TripsModel(this.routeId, this.trip_headsign);
  final routeId;
  final trip_headsign;
}

List<TripsModel> TripsModelList = [];

void setTrips(TripsModel tm) {
  TripsModelList.add(tm);
}

List<TripsModel> getTrips() {
  return TripsModelList;
}
