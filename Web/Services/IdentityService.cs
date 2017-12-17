
using System;
using System.Threading.Tasks;
using Http;
using Newtonsoft.Json;
using Web.Config;
using Web.ViewModels;

namespace Web.Services
{
    public class IdentityService : IIdentityService
    {
        private readonly IHttpClient _apiClient;
        private readonly ApiConfig _apiConfig;
        private const string BasePath= "/api/users";

        public IdentityService(IHttpClient httpClient, ApiConfig apiConfig)
        {
            _apiClient = httpClient;
            _apiConfig = apiConfig;
        }

        public async Task UpdateUserAsync(User user)
        {
            var response = await _apiClient.PostAsync(_apiConfig.IdentityApiUrl+BasePath, user);
            response.EnsureSuccessStatusCode();
        }

        public async Task<User> GetUserAsync(string userId)
        {
            var dataString = await _apiClient.GetStringAsync(_apiConfig.IdentityApiUrl+ BasePath + "/" + userId);
            return JsonConvert.DeserializeObject<User>(dataString);
        }

        public async Task<long> GetUserApplicationCountAsync(string userId)
        {
            var dataString = await _apiClient.GetStringAsync(_apiConfig.IdentityApiUrl + BasePath + "/applicationcount/" + userId);
            return Convert.ToInt64(dataString);
        }
    }
}
