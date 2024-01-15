using System.Collections.Generic;
using demowsp.Abstractions;

namespace demowsp.Abstractions
{
    public interface IUserService
    {
        User GetById(int id);
        IEnumerable<User> GetAll();
        void Create(User user);
        void Update(User user);
        void Delete(int id);
    }
}