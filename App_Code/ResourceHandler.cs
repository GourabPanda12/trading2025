using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ResourceHandler
/// </summary>
public class ResourceHandler : IHttpHandler
{
    public ResourceHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void ProcessRequest(HttpContext context)
    {
        var requestedPath = context.Request.Url.AbsolutePath.ToLower();

        if (requestedPath.Contains("css_bundle"))
        {
            context.Response.ContentType = "text/css";
            string[] cssFiles = new string[]
            {
                    "~/assets/dist/css/base.css",
                    "~/assets/plugins/toastr/toastr.min.css",
                    "~/assets/plugins/emojionearea/emojionearea.min.css",
                    "~/assets/plugins/monthly/monthly.min.css",
                    "~/assets/plugins/amcharts/export.css",
                    "~/assets/dist/css/component_ui.min.css",
                    "~/assets/dist/css/skins/skin-dark-1.min.css",
                    "~/assets/dist/css/custom.css"
            };

            foreach (string cssFile in cssFiles)
            {
                string filePath = context.Server.MapPath(cssFile);
                if (System.IO.File.Exists(filePath))
                {
                    context.Response.Write(System.IO.File.ReadAllText(filePath));
                }
            }
        }
        else if (requestedPath.Contains("js_bundle"))
        {
            context.Response.ContentType = "application/javascript";
            string[] jsFiles = new string[]
            {
                    "~/assets/plugins/jquery/jquery-3.6.0.min.js",
                    "~/assets/plugins/jquery-ui/jquery-ui.min.js",
                    "~/assets/plugins/bootstrap/bootstrap.bundle.min.js",
                    "~/assets/plugins/datatables/jquery.dataTables.min.js",
                    "~/assets/plugins/datatables/responsive.dataTables.min.js"
            };

            foreach (string jsFile in jsFiles)
            {
                string filePath = context.Server.MapPath(jsFile);
                if (System.IO.File.Exists(filePath))
                {
                    context.Response.Write(System.IO.File.ReadAllText(filePath));
                }
            }
        }
    }

  

    bool IHttpHandler.IsReusable
    {
        get
        {
            throw new NotImplementedException();
        }
    }

    void IHttpHandler.ProcessRequest(HttpContext context)
    {
        throw new NotImplementedException();
    }


}