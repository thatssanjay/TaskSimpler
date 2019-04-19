using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WcfRestSample
{
    public class DataProvider
    {
        public static Database DataRepository { get; set; }
    }
}