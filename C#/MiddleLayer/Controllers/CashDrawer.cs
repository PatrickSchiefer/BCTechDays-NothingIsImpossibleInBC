using Microsoft.AspNetCore.Mvc;
using System.Management;
using System.Text.Json;

namespace MiddleLayer.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CashDrawer : ControllerBase
    {

        private readonly ILogger<CashDrawer> _logger;

        public CashDrawer(ILogger<CashDrawer> logger)
        {
            _logger = logger;
        }

        [HttpGet("Open")]
        public void Get()
        {
            Console.WriteLine("TODO implement open cash drawer");
        }
    }
}
