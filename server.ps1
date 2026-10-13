param(
    [int]$Port = 8080,
    [string]$Root = "C:\Users\storr\Downloads\APPPANORAMICAS"
)

$csharp = @'
using System;
using System.IO;
using System.Net;
using System.Threading;

public class DroneServer {
    private HttpListener _listener;
    private string _root;
    private bool _running;

    public DroneServer(string root, int port) {
        _root = root;
        _listener = new HttpListener();
        _listener.Prefixes.Add("http://localhost:" + port + "/");
    }

    public void Start() {
        _listener.Start();
        _running = true;
        ThreadPool.QueueUserWorkItem(ListenLoop);
    }

    public void Stop() {
        _running = false;
        try { _listener.Stop(); } catch { }
    }

    private void ListenLoop(object state) {
        while (_running) {
            try {
                var context = _listener.GetContext();
                ThreadPool.QueueUserWorkItem(HandleRequest, context);
            } catch {
                if (!_running) break;
            }
        }
    }

    private void HandleRequest(object state) {
        var context = (HttpListenerContext)state;
        try {
            var path = context.Request.Url.LocalPath.TrimStart('/');
            if (string.IsNullOrEmpty(path)) path = "index.html";
            path = Uri.UnescapeDataString(path).Replace('/', Path.DirectorySeparatorChar);
            var fullPath = Path.Combine(_root, path);

            context.Response.Headers.Add("Access-Control-Allow-Origin", "*");

            if (File.Exists(fullPath)) {
                var ext = Path.GetExtension(fullPath).ToLowerInvariant();
                context.Response.ContentType = GetMime(ext);
                context.Response.StatusCode = 200;
                using (var fs = File.OpenRead(fullPath)) {
                    context.Response.ContentLength64 = fs.Length;
                    fs.CopyTo(context.Response.OutputStream);
                }
            } else {
                context.Response.StatusCode = 404;
                var msg = System.Text.Encoding.UTF8.GetBytes("404 Not Found");
                context.Response.OutputStream.Write(msg, 0, msg.Length);
            }
        } catch { }
        finally {
            try { context.Response.Close(); } catch { }
        }
    }

    private string GetMime(string ext) {
        switch (ext) {
            case ".html": case ".htm": return "text/html; charset=utf-8";
            case ".js": return "application/javascript; charset=utf-8";
            case ".css": return "text/css; charset=utf-8";
            case ".jpg": case ".jpeg": return "image/jpeg";
            case ".png": return "image/png";
            case ".json": return "application/json";
            case ".svg": return "image/svg+xml";
            default: return "application/octet-stream";
        }
    }
}
'@

try {
    Add-Type -TypeDefinition $csharp -Language CSharp -ErrorAction Stop
} catch {
    # Si ya esta cargado el tipo en la sesion de PowerShell
}

$srv = $null
$actualPort = $Port

try {
    $srv = New-Object DroneServer($Root, $actualPort)
    $srv.Start()
} catch {
    $actualPort = 8085
    $srv = New-Object DroneServer($Root, $actualPort)
    $srv.Start()
}

$url = "http://localhost:$actualPort/"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "       VISOR 360° DRON RTK - SERVIDOR LOCAL ACTIVO         " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " URL: $url" -ForegroundColor Yellow
Write-Host " Abriendo en tu navegador predeterminado..." -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " (Para cerrar el servidor, presiona Ctrl + C o cierra esta ventana)" -ForegroundColor DarkGray

Start-Process $url

try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} finally {
    if ($srv -ne $null) {
        $srv.Stop()
    }
}
