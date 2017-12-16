 
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.ViewModels;

namespace Web.Services
{
    public interface IJobService
    {
        Task<IEnumerable<Job>> GetJobs();
        Task<Job> GetJob(int jobId);
        Task AddApplicant(JobApplicant jobApplicant);
    }
}
