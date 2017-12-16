

using System.Collections.Generic;
using System.Threading.Tasks;
using Http;
using Newtonsoft.Json;
using Web.Config;
using Web.ViewModels;

namespace Web.Services
{
    public class JobService : IJobService
    {
        private readonly IHttpClient _apiClient;
        private readonly ApiConfig _apiConfig;

        public JobService(IHttpClient httpClient, ApiConfig apiConfig)
        {
            _apiClient = httpClient;
            _apiConfig = apiConfig;
        }

        public async Task<IEnumerable<Job>> GetJobs()
        {
            var dataString = await _apiClient.GetStringAsync(_apiConfig.JobsApiUrl+"/api/jobs");
            return JsonConvert.DeserializeObject<IEnumerable<Job>>(dataString);
        }

        public async Task<Job> GetJob(int jobId)
        {
            var dataString = await _apiClient.GetStringAsync(_apiConfig.JobsApiUrl + "/api/jobs/"+jobId);
            return JsonConvert.DeserializeObject<Job>(dataString);
        }

        public async Task AddApplicant(JobApplicant jobApplicant)
        {
            var response = await _apiClient.PostAsync(_apiConfig.JobsApiUrl + "/api/jobs/applicants",jobApplicant);
            response.EnsureSuccessStatusCode();
        }
    }
}

 