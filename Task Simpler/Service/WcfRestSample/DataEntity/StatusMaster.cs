using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WcfRestSample.DataEntity
{
    public class StatusMaster
    {

        public string GetStatus(string MemberId)
        {
            DataSet ds = Utility.GetDatabase.ExecuteDataSet("usp_GetStatus", MemberId);
            return Utility.GetDtToJson(ds.Tables[0]);
        }

    }
}