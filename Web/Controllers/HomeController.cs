 
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web.Models;
using Web.Services;
using Web.ViewModels.HomeViewModels;

namespace Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IJobService _jobService;
 

        public HomeController(IJobService jobService)
        {
            _jobService = jobService;
         
        }

        public async Task<IActionResult> Index()
        {
            return View(new IndexViewModel { Jobs = await _jobService.GetJobs() });
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
