using System.Text.Json;

namespace BlazorAppClient.Data
{
    public class WeatherForecastService
    {
        private static readonly string[] Summaries = new[]
        {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };
        
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