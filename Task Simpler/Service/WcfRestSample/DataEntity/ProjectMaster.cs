using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WcfRestSample.DataEntity
{
    public class ProjectMaster
    {
        public string GetAllProjects(string id)
        {
            DataSet ds = Utility.GetDatabase.ExecuteDataSet("usp_GetProjects", id);
            return Utility.GetDtToJson(ds.Tables[0]);
        }

        public int AddNewProject(string memberid, string projectname, string projectdescription)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_addNewProject", projectname, projectdescription, memberid);
        }

        public int UpdateProject(string Id, string Memberid, string ProjectName, string Description)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_UpdateProject", Memberid, Id, ProjectName, Description);
        }

        public int DeleteProject(string id,string memberid)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_DeleteProjects", id, memberid);
        }

    }
}