

namespace Web.ViewModels.JobsViewModels
{
    public class ApplySuccessViewModel
    {
        public Job Job { get; }
        public long RecentApplicantCount { get; }

        public ApplySuccessViewModel(Job job, long recentApplicantCount)
        {
            Job = job;
            RecentApplicantCount = recentApplicantCount;
        }
    }
}
