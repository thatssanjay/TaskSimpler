using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace WcfRestSample.DataEntity
{
    public class TaskMaster
    {
        
        public string GetTask(string memberid,string projectid)
        {
            DataSet ds = Utility.GetDatabase.ExecuteDataSet("usp_getTask", memberid, projectid);
            return Utility.GetDtToJson(ds.Tables[0]);
        }
        public int AddNewTask(string task,string description, string projectid, string priorityid, string memberid, string comments )
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_AddNewTask", task, memberid, projectid, priorityid, description, comments);
            
        }

        public int DeleteTask(string TaskId)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_DeleteTask", TaskId);

        }

        public int UpdateTaskStatus(string taskid,string memberid, string statusid)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_UpdatTaskStatus", taskid, statusid, memberid);
        }

        public int UpdateTaskPriority(string taskid, string memberid, string statusid)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_UpdatPriority", taskid, statusid, memberid);
        }


        public int DeleteTask(string taskid, string memberid)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_DeleteTask", taskid,  memberid);
        }

        public int TransferTask(string taskid, string projectid)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_transferTask", taskid, projectid);  
        }

        public string TaskDetails(string id) 
        {
            DataSet ds = Utility.GetDatabase.ExecuteDataSet("usp_getSingleTask", id);
            return Utility.GetDtToJson(ds.Tables[0]);
        }

        public int UpdateTask(string taskid, string taskName, string taskDescription)
        {
            return Utility.GetDatabase.ExecuteNonQuery("usp_updateTask", taskid, taskName,taskDescription);
        }



        
    }
}