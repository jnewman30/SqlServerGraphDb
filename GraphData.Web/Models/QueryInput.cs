using System.Collections.Generic;

namespace GraphData.Web.Models
{
    public class QueryInput
    {
        public string OperationName { get; set; }
        public string Query { get; set; }
        public Dictionary<string, object> Variables { get; set; }
    }
}