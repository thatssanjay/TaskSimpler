using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data;
using   System.Data.SqlClient;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Newtonsoft.Json;

namespace WcfRestSample
{
    public class Utility
    {
        //APR212017
        public static string DataTableToJson(DataTable dt)
        {
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    return serializer.Serialize(rows);
          }

        public static Database GetDatabase {
            get { Database db = DatabaseFactory.CreateDatabase();
            return db;
            }
        }
        public static string GetDtToJson(DataTable dt)
        {
         return   JsonConvert.SerializeObject(dt);
        }
        

        

      }
   }




    
