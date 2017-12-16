 

using System.Collections.Generic;
using System.Threading.Tasks;
using Jobs.Api.Models;

namespace Jobs.Api.Services
{
    public interface IJobRepository
    {
        Task<IEnumerable<Job>> GetAll();
        Task<Job> Get(int jobId);
        Task<int> AddApplicant(JobApplicant jobApplicant);
    }
}
