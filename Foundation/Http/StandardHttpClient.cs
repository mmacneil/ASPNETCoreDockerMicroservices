

using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;


namespace Http
{
    public class StandardHttpClient : IHttpClient
    {
        private static readonly HttpClient Client = new HttpClient();
        public async Task<string> GetStringAsync(string uri)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, uri);
            var response = await Client.SendAsync(requestMessage);
            return await response.Content.ReadAsStringAsync();
        }

        public async Task<HttpResponseMessage> PostAsync<T>(string uri, T item)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Post, uri)
            {
                Content = new StringContent(JsonConvert.SerializeObject(item), System.Text.Encoding.UTF8,"application/json")
            };

            var response = await Client.SendAsync(requestMessage);

            if (response.StatusCode == HttpStatusCode.InternalServerError)
            {
                throw new HttpRequestException();
            }

            return response;
        }
    }
}
