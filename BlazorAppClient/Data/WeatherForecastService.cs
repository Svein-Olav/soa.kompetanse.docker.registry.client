using System.Text.Json;

namespace BlazorAppClient.Data
{
    public class WeatherForecastService
    {
        private static readonly string[] Summaries = new[]
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

        // Create a method to get the weather forecast for a specific date. Getting from the web api https://backend/WeatherForecast/2021-01-01
        // The method should return a array of WeatherForecast object
        public async Task<WeatherForecast[]> GetForecastAsync()
        {
            var httpClient = new HttpClient();
            var response = await httpClient.GetAsync($"http://backend/WeatherForecast");
            var json = await response.Content.ReadAsStringAsync();
            var weatherForecast = JsonSerializer.Deserialize<WeatherForecast[]>(json, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            return weatherForecast;
        }

    }
}