using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WcfRestSample.DataEntity
{
    public class PriorityMaster
    {

        public string GetPriority(string memberId)
        {
            DataSet ds = Utility.GetDatabase.ExecuteDataSet("usp_getPriority", memberId);
            return Utility.GetDtToJson(ds.Tables[0]);
        }
    }
}