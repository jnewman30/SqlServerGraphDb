using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace GraphData.Web
{
    public class Startup
    {
        private const string DefaultCorsPolicyName = "default";
        private const string AngularWebAppUri = "http://localhost:4200";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services
               .AddCors(options =>
                            options.AddPolicy(DefaultCorsPolicyName, policy =>
                            {
                                policy
                                   .WithOrigins(AngularWebAppUri)
                                   .AllowAnyHeader()
                                   .AllowAnyMethod()
                                   .AllowCredentials()
                                   .WithExposedHeaders("WWW-Authenticate");
                            }))
               .AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app
               .UseCors(DefaultCorsPolicyName)
               .UseMvc();
        }
    }
}