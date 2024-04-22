@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Column(
        children: [
          Text('Weather App'),
        ],
      ),
    ),
    body: Center(
      child: _weatherData != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_weatherData.cityName}, ${_weatherData.country}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  '${_weatherData.description}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Temperature: ${_weatherData.temperature}°C',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Humidity: ${_weatherData.humidity}%',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Wind Speed: ${_weatherData.windSpeed} m/s',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
              ],
            )
          : CircularProgressIndicator(),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Enter City'),
              content: TextField(
                controller: _cityController,
                decoration: InputDecoration(hintText: 'City Name'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _getWeatherData(_cityController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Get Weather'),
                ),
              ],
            );
          },
        );
      },
      tooltip: 'Get Weather',
      child: Icon(Icons.search),
    ),
    // Add your name and designation to the footer
    // Adjust the alignment and styling as needed
    bottomNavigationBar: BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.blue,
        child: Center(
          child: Text(
            'Made By Alwyn Antony Ben, 4Bsc DS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
