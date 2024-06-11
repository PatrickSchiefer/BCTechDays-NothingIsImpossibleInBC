namespace SQLPlugin
{
    using Microsoft.Dynamics.BusinessCentral.Agent.Common;
    using System;
    using System.Collections.Generic;
    using System.Management;
    using System.Text.Json;
    using System.Data.SqlClient;

    [AgentPlugin("SQL/V1.0")]
    public class SQL : IAgentPlugin
    {
        [PluginMethod("GET")]
        public string Get()
        {
            try
            {
                SqlConnectionStringBuilder  builder = new SqlConnectionStringBuilder();
                builder.DataSource = "BCTechDays";
                builder.InitialCatalog = "SQLDemo";
                builder.IntegratedSecurity = true;
                SqlConnection connection = new SqlConnection(builder.ConnectionString);
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM DemoTable", connection);
                SqlDataReader reader = command.ExecuteReader();
                List<dynamic> result = new List<dynamic>();
                while (reader.Read())
                {
                    dynamic content = new System.Dynamic.ExpandoObject();
                    content.PrimaryKey = reader.GetInt32(reader.GetOrdinal("PrimaryKey"));
                    content.Name = reader.GetString(reader.GetOrdinal("Text"));

                    result.Add(content);
                }
                connection.Close();
                return JsonSerializer.Serialize(result);
            }
            catch (Exception ex)
            {
                return JsonSerializer.Serialize(new { Error = ex.Message });
            }
        }
    }
}
