using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AcessoPortao.Startup))]
namespace AcessoPortao
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
