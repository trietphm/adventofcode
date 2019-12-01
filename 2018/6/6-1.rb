
max_lat, max_lng = 0, 0
locations = File.read('input').each_line.map { |line|
  m = line.match /(?<lat>\d+), (?<lng>\d+)/
  lat = m[:lat].to_i
  lng = m[:lng].to_i
  max_lat = lat if max_lat < lat
  max_lng = lat if max_lng < lng

  {lat: lat, lng: lng}
}



puts locations, max_lat, max_lng
