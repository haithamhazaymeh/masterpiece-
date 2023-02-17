using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(hikaya_Ajloun.Startup))]
namespace hikaya_Ajloun
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
