 

using System;

namespace Jobs.Api.Models
{
    public class JobApplicant
    {
        public int Id { get; set; }
        public int JobId { get; set; }
        public int ApplicantId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool? Active { get; set; }
    }
}
