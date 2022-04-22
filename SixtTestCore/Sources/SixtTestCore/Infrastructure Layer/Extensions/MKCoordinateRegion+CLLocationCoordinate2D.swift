import MapKit

public extension MKCoordinateRegion {

  init(coordinates: [CLLocationCoordinate2D]) {
      
      var minLatitude: CLLocationDegrees = 90.0
      var maxLatitude: CLLocationDegrees = -90.0
      var minLongitude: CLLocationDegrees = 180.0
      var maxLongitude: CLLocationDegrees = -180.0

      for coordinate in coordinates {
          
          let lat = Double(coordinate.latitude)
          let long = Double(coordinate.longitude)
          
          if lat < minLatitude {
              minLatitude = lat
          }
          
          if long < minLongitude {
              minLongitude = long
          }
          
          if lat > maxLatitude {
              maxLatitude = lat
          }
          
          if long > maxLongitude {
              maxLongitude = long
          }
          
      }
      
      let span = MKCoordinateSpan(latitudeDelta: (maxLatitude - minLatitude) * 1.25, longitudeDelta: (maxLongitude - minLongitude) * 1.25)
      let center = CLLocationCoordinate2DMake((maxLatitude - span.latitudeDelta / 2.5), (maxLongitude - span.longitudeDelta / 2.5))
      
      self.init(center: center, span: span)
  }
}
