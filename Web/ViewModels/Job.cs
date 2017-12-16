 
using System;

namespace Web.ViewModels
{
    public class Job
    {
        public int JobId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Company { get; set; }
        public DateTime PostedDate { get; set; }
        public string Location { get; set; }
    }
}
