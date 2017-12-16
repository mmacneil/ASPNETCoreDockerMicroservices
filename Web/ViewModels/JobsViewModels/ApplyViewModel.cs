 

namespace Web.ViewModels.JobsViewModels
{
    public class ApplyViewModel
    {
        public Job Job { get; }
        public User Applicant { get; }

        public ApplyViewModel(Job job,User applicant)
        {
            Job = job;
            Applicant = applicant;
        }
    }
}
