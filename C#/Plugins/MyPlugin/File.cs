namespace SQLPlugin
{
    using Microsoft.Dynamics.BusinessCentral.Agent.Common;
    using System.IO;

    [AgentPlugin("File/V1.0")]
    public class File : IAgentPlugin
    {
        [PluginMethod("GET")]
        public string Get()
        {
            StreamReader reader = new StreamReader("C:\\Temp\\DemoFile.txt");
            string content = reader.ReadToEnd();
            reader.Close();
            return content;
        }
    }
}
