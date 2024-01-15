using System;
using System.Collections.Generic;
using System.Linq;
using demowsp.Abstractions;

namespace demowsp.Services
{
    public class UserService : IUserService
    {
        private readonly List<User> users = new List<User>
        {
            new User { Id = 1, Name = "Alice", Email = "alice@example.com" },
            new User { Id = 2, Name = "Bob", Email = "bob@example.com" },
            // Add more users as needed
        };

        public User GetById(int id)
        {
            return users.FirstOrDefault(u => u.Id == id);
        }

        public IEnumerable<User> GetAll()
        {
            return users;
        }

        public void Create(User user)
        {
            if (users.Any(u => u.Id == user.Id))
            {
                throw new ArgumentException("User with the same id already exists.");
            }

            users.Add(user);
        }

        public void Update(User user)
        {
            var existingUser = users.FirstOrDefault(u => u.Id == user.Id);
            if (existingUser == null)
            {
                throw new ArgumentException("User does not exist.");
            }

            existingUser.Name = user.Name;
            existingUser.Email = user.Email;
            // Update other fields as needed
        }

        public void Delete(int id)
        {
            var user = users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                throw new ArgumentException("User does not exist.");
            }

            users.Remove(user);
        }
    }
}