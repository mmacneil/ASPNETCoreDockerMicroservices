 
using System.Threading.Tasks;
using Applicants.Api.Models;
using Applicants.Api.Services;
using Events;
using MassTransit;

namespace Applicants.Api.Messaging.Consumers
{
    public class ApplicantAppliedEventConsumer : IConsumer<ApplicantAppliedEvent>
    {
        private readonly IApplicantRepository _applicantRepository;

        public ApplicantAppliedEventConsumer(IApplicantRepository applicantRepository)
        {
            _applicantRepository = applicantRepository;
        }

        public async Task Consume(ConsumeContext<ApplicantAppliedEvent> context)
        {
            await _applicantRepository.AddApplicantSubmission(new ApplicantSubmission
            {
                JobId = context.Message.JobId,
                ApplicantId = context.Message.ApplicantId,
                Title = context.Message.Title,
                SubmissionDate = context.Message.CreationDate
            });
        }
    }
}
