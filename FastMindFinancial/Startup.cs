using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using FastMindFinancial.Model.Contrato;
using FastMindFinancial.Repository;
using AutoMapper;
using FastMindFinancial.Model;
using FastMindFinancial.AppService;
using FastMindFinancial.Models;

namespace FastMindFinancial
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            var builder = new ConfigurationBuilder()
               .AddJsonFile("appsettings.json")
               .AddJsonFile("appsettings.Development.json", true)
               .AddEnvironmentVariables();

            Configuration = builder.Build();
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });
            services.AddAutoMapper();
            services.AddDbContext<FastMindFinancialContext>(options => options.UseSqlServer(Configuration["Data:FastMindFinancialApp:ConnectionString"], b => b.MigrationsAssembly("FastMindFinancial")));
            services.AddTransient<IFastMindFinancialRepository, FastMindFinancialRepository>();
            services.AddTransient<ServicoCredito>();
            services.AddTransient<ApplicationFastMindFinancialService>();


            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, IServiceProvider services)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseMvc();

            SeedData.SeedDatabase(services.GetRequiredService<FastMindFinancialContext>());
        }
    }
}
