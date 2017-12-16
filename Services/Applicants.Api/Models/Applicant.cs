using System.ComponentModel.DataAnnotations;

namespace Applicants.Api.Models
{
    public class Applicant
    {
        [Key]
        public int ApplicantId { get; set; }
        public string Name { get; set; }      
        public string Email { get; set; }   
        public string Address { get; set; }    
        public string PhoneNo { get; set; }   
    }
}