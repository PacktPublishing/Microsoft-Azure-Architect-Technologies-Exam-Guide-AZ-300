using Newtonsoft.Json;
using System;

namespace PacktSQLApp
{

    public class Employee
    {
        [JsonProperty(PropertyName = "id")]
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime? HireDate { get; set; }
        //public Address[] Addresses { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
