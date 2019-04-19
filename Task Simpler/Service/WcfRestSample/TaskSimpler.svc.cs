using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfRestSample
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "TaskSimpler" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select TaskSimpler.svc or TaskSimpler.svc.cs at the Solution Explorer and start debugging.
    public class TaskSimpler : ITaskSimpler
    {
        DataObjects objDB = new DataObjects();
        #region ProjectMaster

        public string GetProjectDetails(string id)
        {
            return objDB.ProjectMasterProvider.GetAllProjects(id);
        }


        public string AddNewProject(string Memberid, string ProjectName, string Description)
        {
            try
            {
                objDB.ProjectMasterProvider.AddNewProject(Memberid, ProjectName, Description);
                return "Project successfully Added";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public string UpdateProject(string Id, string Memberid, string ProjectName, string Description)
        {
            try
            {
                objDB.ProjectMasterProvider.UpdateProject(Id, Memberid, ProjectName, Description);
                return "Project successfully Updated";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string DeleteProject(string Id, string Memberid)
        {
            try
            {
                objDB.ProjectMasterProvider.DeleteProject(Id, Memberid);
                return "Project successfully Deleted";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #endregion
        #region Task
        public string GetTask(string memberid,string projectid)
        {
            try
            {
                return objDB.TaskMasterProvider.GetTask(memberid, projectid);
                
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public string AddTask(string Task, string Memberid, string projectid, string priorityid, string description, string comments)
        {
            try
            {

                objDB.TaskMasterProvider.AddNewTask(Task, description, projectid, priorityid, Memberid, comments);
                return "New Task Created successfuly";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
             
            
        }

        public string DeleteTask(string TaskId)
        {
            try
            {
                objDB.TaskMasterProvider.DeleteTask(TaskId);
                return " Deleted Successfuly";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string UpdateTaskStatus(string taskid, string memberid, string statusid)
        {
            try
            {
                objDB.TaskMasterProvider.UpdateTaskStatus(taskid, memberid, statusid);
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string UpdateTaskPriority(string taskid, string memberid, string Priorityid) {
            try
            {
                objDB.TaskMasterProvider.UpdateTaskPriority(taskid, memberid, Priorityid);
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string TransferTask(string taskid, string projectid)
        {
            try
            {
                objDB.TaskMasterProvider.TransferTask(taskid, projectid);
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string TaskDetails(string id)
        {
            try
            {
               return objDB.TaskMasterProvider.TaskDetails(id);
                 
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        
        public string UpdateTask(string taskid, string taskName, string taskDescription)
        {
            try
            {
                 objDB.TaskMasterProvider.UpdateTask(taskid, taskName, taskDescription);
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        
        #endregion
        #region Priority
        public string GetPriority(string memberid)
        {
            try
            {
                return objDB.PriorityProvider.GetPriority((memberid));
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            
        }
        
        
        #endregion

        #region StatusMaster
        public string GetStatus(string memberid) { 
            try 
            {
                return objDB.StatusProvider.GetStatus((memberid));
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #endregion
    }
}
