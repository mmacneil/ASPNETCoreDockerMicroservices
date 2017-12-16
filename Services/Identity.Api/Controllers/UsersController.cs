 
 
using System.Threading.Tasks;
using Identity.Api.Models;
using Identity.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Identity.Api.Controllers
{
    [Route("api/[controller]")]
    public class UsersController : Controller
    {
        private readonly IIdentityRepository _identityRespository;

        public UsersController(IIdentityRepository identityRespository)
        {
            _identityRespository = identityRespository;
        }

        // GET api/users/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            var user = await _identityRespository.GetUserAsync(id);
            return Ok(user);
        }


        // POST api/users
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]User value)
        {
            var user = await _identityRespository.UpdateUserAsync(value);
            return Ok(user);
        }
    }
}
