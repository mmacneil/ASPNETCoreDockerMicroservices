 
using System;
using System.ComponentModel.DataAnnotations;

namespace Applicants.Api.Models
{
    public class ApplicantSubmission
    {
        [Key]
        public int Id { get; set; }
        public int JobId { get; set; }
        public int ApplicantId { get; set; }
        public string Title { get; set; }
        public DateTime SubmissionDate { get; set; }
    }
}

 
