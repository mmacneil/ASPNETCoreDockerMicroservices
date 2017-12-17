
using System;
using System.Threading.Tasks;
using Identity.Api.Models;
using Newtonsoft.Json;
using StackExchange.Redis;

namespace Identity.Api.Services
{
    public class IdentityRepository : IIdentityRepository
    {
        private readonly IDatabase _database;

        public IdentityRepository(ConnectionMultiplexer redis)
        {
            _database = redis.GetDatabase();
        }

        public async Task<User> UpdateUserAsync(User user)
        {
            var created = await _database.StringSetAsync(user.Id, JsonConvert.SerializeObject(user));
            if (!created) return null;
            return await GetUserAsync(user.Id);
        }

        public async Task<long> UpdateUserApplicationCountAsync(string userId)
        {
            return await _database.StringIncrementAsync($"{userId}-appcnt");
        }

        public async Task<User> GetUserAsync(string userId)
        {
            var data = await _database.StringGetAsync(userId);
            return data.IsNullOrEmpty ? null : JsonConvert.DeserializeObject<User>(data);
        }

        public async Task<long> GetUserApplicationCountAsync(string userId)
        {
            var data = await _database.StringGetAsync($"{userId}-appcnt");
            return data.IsNullOrEmpty ? 0 : Convert.ToInt64(data);
        }
    }
}
