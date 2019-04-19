using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using Microsoft.Practices.EnterpriseLibrary.Data;
using  WcfRestSample.DataEntity;

namespace WcfRestSample
{
    public class DataObjects
    {
       
        public DataEntity.ProjectMaster ProjectMasterProvider
        {
            get {
                DataEntity.ProjectMaster objProject = new DataEntity.ProjectMaster();
                return objProject;
            }
           
        }
        public DataEntity.TaskMaster TaskMasterProvider
        {
            get
            {
                DataEntity.TaskMaster objTask = new DataEntity.TaskMaster();
                return objTask;
            }

        }

        public DataEntity.PriorityMaster PriorityProvider
        {
            get
            {
                DataEntity.PriorityMaster objTask = new DataEntity.PriorityMaster();
                return objTask;
            }

        }

        public DataEntity.StatusMaster StatusProvider
        {
            get
            {
                DataEntity.StatusMaster objTask = new DataEntity.StatusMaster();
                return objTask;
            }

        }

    }
}