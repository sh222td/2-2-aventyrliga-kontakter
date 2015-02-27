using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WebApplication4
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            var jQuery = new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-2.1.3.min.js",
             //   DebugPath = "~/Scripts/jquery-2.0.3.js",
                CdnPath = "https://ajax.microsoft.com/ajax/jQuery/jquery-2.0.1.min.js",
               // CdnDebugPath = "https://ajax.microsoft.com/ajax/jQuery/jquery-2.0.1.js"
            };
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", jQuery);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        public object jQuery { get; set; }
    }
}