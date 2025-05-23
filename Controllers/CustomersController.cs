using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using sky_webapi.DTOs;
using sky_webapi.Services;

namespace sky_webapi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public CustomersController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerDto>>> GetCustomers()
        {
            var customers = await _customerService.GetAllCustomersAsync();
            return Ok(customers);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CustomerDto>> GetCustomer(int id)
        {
            var customer = await _customerService.GetCustomerByIdAsync(id);
            if (customer == null)
            {
                return NotFound();
            }

            // If user is a customer, they can only access their own data
            if (User.HasClaim("IsCustomer", "True"))
            {
                var customerIdClaim = User.Claims.FirstOrDefault(c => c.Type == "CustomerId");
                if (customerIdClaim == null || int.Parse(customerIdClaim.Value) != id)
                {
                    return Forbid();
                }
            }

            return Ok(customer);
        }

        [HttpPost]
        public async Task<ActionResult<CustomerDto>> CreateCustomer(CustomerDto customerDto)
        {
            var createdCustomer = await _customerService.CreateCustomerAsync(customerDto);
            return CreatedAtAction(nameof(GetCustomer), new { id = createdCustomer.CustID }, createdCustomer);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCustomer(int id, CustomerDto customerDto)
        {
            var updatedCustomer = await _customerService.UpdateCustomerAsync(id, customerDto);
            if (updatedCustomer == null)
            {
                return NotFound();
            }
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            await _customerService.DeleteCustomerAsync(id);
            return NoContent();
        }
    }
}
