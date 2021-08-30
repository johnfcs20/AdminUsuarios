using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AminClientesAPI.Servicios;
using core.Interface;
using core.Interfaces;
using core.Repositorio;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace AminClientesAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            ConfigureRepositories(services);
            ConfigureServicio(services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        public void ConfigureRepositories(IServiceCollection services)
        {
            services.AddScoped<IGestorDB>(_ => new GestorDB(Configuration.GetConnectionString("AdminClientes"), Configuration));
        }

        public void ConfigureServicio(IServiceCollection services)
        {
            services.AddScoped<IUsuarios, UsuariosServicios>();


        }
    }
}
