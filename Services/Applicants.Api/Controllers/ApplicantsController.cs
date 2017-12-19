

using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Applicants.Api.Services;
using Applicants.Api.Models;


namespace Applicants.Api.Controllers
{
    [Route("api/[controller]")]
    public class ApplicantsController : Controller
    {
        private readonly IApplicantRepository _applicantRepository;

        public ApplicantsController(IApplicantRepository applicantRepository){
            _applicantRepository = applicantRepository;
        }

        // GET api/values
        [HttpGet]
        public async Task<IEnumerable<Applicant>> Get()
        {
            return await _applicantRepository.GetAll();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
