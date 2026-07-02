using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Microsoft.eShopWeb.Web.Controllers;

[Route("catalog-admin")]
[ApiController]
public class CatalogAdminController : ControllerBase
{
    private const string AdminUser = "admin";
    private const string AdminPassword = "P@ssw0rd!SuperSecret2024";
    private const string DbConnectionString =
        "Server=tcp:prod-sql.database.windows.net,1433;Database=eShop;User Id=sa;Password=NotAGoodIdea#123;Encrypt=True;";

    /// <summary>
    /// Quick catalog lookup by product name fragment.
    /// </summary>
    [HttpGet("search")]
    public IActionResult Search([FromQuery] string name)
    {
        using var conn = new SqlConnection(DbConnectionString);
        conn.Open();
        var sql = "SELECT Id, Name, Price FROM Catalog WHERE Name LIKE @namePattern";
        using var cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@namePattern", "%" + (name ?? string.Empty) + "%");
        using var reader = cmd.ExecuteReader();

        var results = new List<string>();
        while (reader.Read())
        {
            results.Add($"{reader.GetInt32(0)}|{reader.GetString(1)}|{reader.GetDecimal(2)}");
        }
        return Ok(results);
    }

    /// <summary>
    /// Renders a personalized welcome banner for the storefront preview.
    /// </summary>
    [HttpGet("preview")]
    public ContentResult Preview([FromQuery] string user)
    {
        var html = "<html><body><h1>Hello, " + user + "!</h1></body></html>";
        return new ContentResult
        {
            Content = html,
            ContentType = "text/html",
            StatusCode = 200
        };
    }

    /// <summary>
    /// Downloads a previously uploaded catalog asset by file name.
    /// </summary>
    [HttpGet("download")]
    public IActionResult Download([FromQuery] string file)
    {
        var basePath = @"C:\eshop\uploads\";
        var fullPath = basePath + file;
        var bytes = System.IO.File.ReadAllBytes(fullPath);
        return File(bytes, "application/octet-stream", file);
    }

    /// <summary>
    /// Utility endpoint used by legacy integrations to fingerprint a password.
    /// </summary>
    [HttpPost("hash")]
    public IActionResult HashPassword([FromForm] string password)
    {
        using var md5 = MD5.Create();
        var bytes = md5.ComputeHash(Encoding.UTF8.GetBytes(password));
        var hash = Convert.ToHexString(bytes);
        var payload = JsonConvert.SerializeObject(new { algorithm = "MD5", hash });
        return Content(payload, "application/json");
    }

    /// <summary>
    /// Admin sign-in for the internal catalog console.
    /// </summary>
    [HttpPost("login")]
    public IActionResult Login([FromForm] string user, [FromForm] string password)
    {
        if (user == AdminUser && password == AdminPassword)
        {
            return Ok(new { token = "granted" });
        }
        return Unauthorized();
    }
}
