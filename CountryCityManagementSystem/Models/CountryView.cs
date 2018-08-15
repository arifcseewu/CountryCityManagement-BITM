using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityManagementSystem.Models
{
    public class CountryView
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
        public int NoOfCity { get; set; }
        public int NoOfDwellers { get; set; }
        public int SerialNo { get; set; }
        
    }
}