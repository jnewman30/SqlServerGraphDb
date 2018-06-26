using System.Threading.Tasks;
using GraphData.Core.GraphQL;
using GraphData.Web.Models;
using GraphQL;
using GraphQL.Instrumentation;
using GraphQL.Validation.Complexity;
using Microsoft.AspNetCore.Mvc;

namespace GraphData.Web.Controllers
{
    [Produces("application/json")]
    [Route("api/Graph")]
    public class GraphController : Controller
    {
        public GraphController()
        {
            var query = new RootQuery();
            Schema = new RootSchema(query);
            Executor = new DocumentExecuter();
        }

        private RootSchema Schema { get; }
        private IDocumentExecuter Executor { get; }

        [HttpPost]
        public async Task<IActionResult> Run([FromBody] QueryInput queryInput)
        {
            var inputs = queryInput.Variables != null
                ? new Inputs(queryInput.Variables)
                : new Inputs();

            var result = await Executor.ExecuteAsync(
                                            cfg =>
                                            {
                                                cfg.Schema = Schema;
                                                cfg.Query = queryInput.Query;
                                                cfg.OperationName = queryInput.OperationName;
                                                cfg.Inputs = inputs;
                                                cfg.ComplexityConfiguration =
                                                    new ComplexityConfiguration {MaxDepth = 15};
                                                cfg.FieldMiddleware.Use<InstrumentFieldsMiddleware>();
                                            })
                                       .ConfigureAwait(false);

            return Ok(result);
        }
    }
}