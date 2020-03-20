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
using Swashbuckle.AspNetCore.Swagger;
using Microsoft.Extensions.PlatformAbstractions;
using System.IO;

namespace FastMindFinancial
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
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

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1",
                    new Info
                    {
                        Title = "Financiamentos",
                        Version = "v1",
                        Description = "Teste de para aplicação de Financiamentos",
                        Contact = new Contact
                        {
                            Name = "Fernando Augusto Ribeiro Alves",
                            Url = "https://github.com/faralves/FastMindFinancial"
                        }
                    });

                string caminhoAplicacao =
                    PlatformServices.Default.Application.ApplicationBasePath;
                string nomeAplicacao =
                    PlatformServices.Default.Application.ApplicationName;
                string caminhoXmlDoc =
                    Path.Combine(caminhoAplicacao, $"{nomeAplicacao}.xml");

                c.IncludeXmlComments(caminhoXmlDoc);
            });
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, IServiceProvider services)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseMvc();

            SeedData.SeedDatabase(services.GetRequiredService<FastMindFinancialContext>());

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json",
                    "Financiamentos");
            });
        }
    }
}
