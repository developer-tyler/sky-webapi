using Microsoft.EntityFrameworkCore;
using sky_webapi.Data;
using sky_webapi.DTOs;
using sky_webapi.Data.Entities;

namespace sky_webapi.Services
{
    public class CustomerService : ICustomerService
    {
        private readonly AppDbContext _context;

        public CustomerService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<CustomerDto>> GetAllCustomersAsync()
        {
            return await _context.Customers
                .Select(c => new CustomerDto
                {
                    CustID = c.CustID,
                    CompanyName = c.CompanyName ?? string.Empty,
                    ContactTitle = c.ContactTitle ?? string.Empty,
                    ContactFirstNames = c.ContactFirstNames ?? string.Empty,
                    ContactSurname = c.ContactSurname ?? string.Empty,
                    Line1 = c.Line1 ?? string.Empty,
                    Line2 = c.Line2 ?? string.Empty,
                    Line3 = c.Line3 ?? string.Empty,
                    Line4 = c.Line4 ?? string.Empty,
                    Postcode = c.Postcode ?? string.Empty,
                    Telephone = c.Telephone ?? string.Empty,
                    Fax = c.Fax ?? string.Empty,
                    Email = c.Email ?? string.Empty
                })
                .ToListAsync();
        }

        public async Task<CustomerDto?> GetCustomerByIdAsync(int id)
        {
            var customer = await _context.Customers.FindAsync(id);
            if (customer == null)
            {
                return null;
            }

            return new CustomerDto
            {
                CustID = customer.CustID,
                CompanyName = customer.CompanyName ?? string.Empty,
                ContactTitle = customer.ContactTitle ?? string.Empty,
                ContactFirstNames = customer.ContactFirstNames ?? string.Empty,
                ContactSurname = customer.ContactSurname ?? string.Empty,
                Line1 = customer.Line1 ?? string.Empty,
                Line2 = customer.Line2 ?? string.Empty,
                Line3 = customer.Line3 ?? string.Empty,
                Line4 = customer.Line4 ?? string.Empty,
                Postcode = customer.Postcode ?? string.Empty,
                Telephone = customer.Telephone ?? string.Empty,
                Fax = customer.Fax ?? string.Empty,
                Email = customer.Email ?? string.Empty
            };
        }

        public async Task<CustomerDto> CreateCustomerAsync(CustomerDto customerDto)
        {
            var customer = new CustomerEntity
            {
                CompanyName = customerDto.CompanyName ?? string.Empty,
                ContactTitle = customerDto.ContactTitle ?? string.Empty,
                ContactFirstNames = customerDto.ContactFirstNames ?? string.Empty,
                ContactSurname = customerDto.ContactSurname ?? string.Empty,
                Line1 = customerDto.Line1 ?? string.Empty,
                Line2 = customerDto.Line2 ?? string.Empty,
                Line3 = customerDto.Line3 ?? string.Empty,
                Line4 = customerDto.Line4 ?? string.Empty,
                Postcode = customerDto.Postcode ?? string.Empty,
                Telephone = customerDto.Telephone ?? string.Empty,
                Fax = customerDto.Fax ?? string.Empty,
                Email = customerDto.Email ?? string.Empty
            };

            _context.Customers.Add(customer);
            await _context.SaveChangesAsync();

            customerDto.CustID = customer.CustID;
            return customerDto;
        }

        public async Task<CustomerDto?> UpdateCustomerAsync(int id, CustomerDto customerDto)
        {
            var customer = await _context.Customers.FindAsync(id);
            if (customer == null)
            {
                return null;
            }

            customer.CompanyName = customerDto.CompanyName ?? string.Empty;
            customer.ContactTitle = customerDto.ContactTitle ?? string.Empty;
            customer.ContactFirstNames = customerDto.ContactFirstNames ?? string.Empty;
            customer.ContactSurname = customerDto.ContactSurname ?? string.Empty;
            customer.Line1 = customerDto.Line1 ?? string.Empty;
            customer.Line2 = customerDto.Line2 ?? string.Empty;
            customer.Line3 = customerDto.Line3 ?? string.Empty;
            customer.Line4 = customerDto.Line4 ?? string.Empty;
            customer.Postcode = customerDto.Postcode ?? string.Empty;
            customer.Telephone = customerDto.Telephone ?? string.Empty;
            customer.Fax = customerDto.Fax ?? string.Empty;
            customer.Email = customerDto.Email ?? string.Empty;

            await _context.SaveChangesAsync();

            return customerDto;
        }

        public async Task DeleteCustomerAsync(int id)
        {
            var customer = await _context.Customers.FindAsync(id);
            if (customer != null)
            {
                _context.Customers.Remove(customer);
                await _context.SaveChangesAsync();
            }
        }
    }
}
