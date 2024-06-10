using Microsoft.AspNetCore.Mvc;
using System.Management;
using System.Text.Json;

namespace MiddleLayer.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class Printers : ControllerBase
    {

        private readonly ILogger<Printers> _logger;

        public Printers(ILogger<Printers> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<string> Get()
        {

            var printerQuery = new ManagementObjectSearcher("SELECT * from Win32_Printer");
            List<string> printers = new List<string>();
            foreach (var printer in printerQuery.Get())
            {
                printers.Add("[MiddleLayer]" + printer.GetPropertyValue("Name").ToString());

            }
            return printers;
        }
    }
}
