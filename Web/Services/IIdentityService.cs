 
using System.Threading.Tasks;
using Web.ViewModels;

namespace Web.Services
{
    public interface IIdentityService
    {
        Task UpdateUserAsync(User user);
        Task<User> GetUserAsync(string userId);
        Task<long> GetUserApplicationCountAsync(string userId);
    }
}
