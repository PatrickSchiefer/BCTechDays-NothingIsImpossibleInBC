// See https://aka.ms/new-console-template for more information
using System.Net;
using System.Net.Http.Json;
using System.Text.Json.Nodes;

string path = "Z:\\watched";
string filename = "import.txt";

SendFileToBC(path, filename);
Console.WriteLine("Start filesystem watcher");
FileSystemWatcher watcher = new FileSystemWatcher();
watcher.Created += (s, e) =>
{
    SendFileToBC(path, filename);
};
watcher.Path = "Z:\\watched";
watcher.EnableRaisingEvents = true;

Console.WriteLine("Press any key to quit");
Console.ReadKey();

static void SendFileToBC(string path, string filename)
{
    HttpClient httpClient = new HttpClient();

    if (File.Exists(Path.Combine(path, filename)))
    {
        Console.WriteLine("======================================");
        Console.WriteLine($"Read file {Path.Combine(path,filename)}");
        StreamReader streamReader = null; 
        try
        {
            streamReader = new StreamReader(new FileStream(Path.Combine(path, filename), FileMode.Open));
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
            Console.WriteLine("Failed to open file, try again after some Miliseconds");
            Thread.Sleep(new Random(DateTime.Now.Millisecond).Next(10, 300));
            SendFileToBC(path, filename);
            return;
        }
        string line = streamReader.ReadLine();
        while (line != null)
        {
            try
            {
                string[] splitLine = line.Split(";");
                foreach (string element in splitLine)
                {
                    HttpRequestMessage httpRequestMessage = new HttpRequestMessage();
                    httpRequestMessage.Method = HttpMethod.Post;
                    httpRequestMessage.RequestUri = new Uri("https://cosmo-alpaca.westeurope.cloudapp.azure.com/f03a1ec20fd3rest/api/PatrickSchiefer/DOK/v1.0/importData");
                    httpRequestMessage.Headers.Add("Authorization", "Basic UFNjaGllZmVyODM1MTpJZXJ2MzEyNQ==");
                    httpRequestMessage.Content = JsonContent.Create(new { data = element });
                    Console.WriteLine($"Send {element} to BC");
                    httpClient.Send(httpRequestMessage);
                }
                line = streamReader.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sendig file");
                Console.WriteLine(ex.Message);
            }
        }
        streamReader.Close();
        File.Delete(Path.Combine(path, filename));
        Console.WriteLine("Send file successfully");
    }
}