namespace PrintersPlugin
{
    using Microsoft.Dynamics.BusinessCentral.Agent.Common;
    using System;
    using System.Collections.Generic;
    using System.Management;
    using System.Text.Json;

    [AgentPlugin("printers/V1.0")]
    public class Printers : IAgentPlugin
    {
        [PluginMethod("GET")]
        public string Get()
        {
            var printerQuery = new ManagementObjectSearcher("SELECT * from Win32_Printer");
            List<string> printers = new List<string>();
            foreach (var printer in printerQuery.Get())
            {
                printers.Add("[BCAgent]" + printer.GetPropertyValue("Name").ToString());
                
            }
            return JsonSerializer.Serialize(printers);
        }
    }
}
