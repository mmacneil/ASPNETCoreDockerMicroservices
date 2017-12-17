
using Identity.Api.Models;
using System.Threading.Tasks;

namespace Identity.Api.Services
{
    public interface IIdentityRepository
    {
        Task<User> UpdateUserAsync(User user);
        Task<User> GetUserAsync(string userId);
        Task<long> UpdateUserApplicationCountAsync(string userId);
        Task<long> GetUserApplicationCountAsync(string userId);
    }
}
