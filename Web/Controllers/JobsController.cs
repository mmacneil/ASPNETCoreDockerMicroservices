

using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web.Services;
using Web.ViewModels;
using Web.ViewModels.JobsViewModels;

namespace Web.Controllers
{
    public class JobsController : Controller
    {
        private readonly IJobService _jobService;
        private readonly IIdentityService _identityService;

        public JobsController(IJobService jobService, IIdentityService identityService)
        {
            _jobService = jobService;
            _identityService = identityService;
        }

        // GET jobs/apply/5
        [HttpGet("jobs/apply/{id}")]
        public async Task<IActionResult>  Apply(int id)
        {
            var job = await _jobService.GetJob(id);
            var applicant = await _identityService.GetUserAsync("1"); // hardcoded to user we stashed in identity service
            return View(new ApplyViewModel(job,applicant));
        }

        // POST jobs/apply
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Apply(JobApplicationViewModel model)
        {
            await Task.Delay(1000);
            await _jobService.AddApplicant(new JobApplicant
            {
                Email = model.Applicant.Email,
                Name = model.Applicant.Name,
                ApplicantId = Convert.ToInt32(model.Applicant.Id),
                JobId = model.Job.JobId
            });

            return RedirectToAction("Index", "Home");
        }
    }
}
