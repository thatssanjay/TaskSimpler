using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfRestSample
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ITaskSimpler" in both code and config file together.
    [ServiceContract]
    public interface ITaskSimpler
    {
        #region Project Master
        [OperationContract]
        [WebGet(UriTemplate = "GetProjects/{id}", ResponseFormat = WebMessageFormat.Json)]
        string GetProjectDetails(string id);

        [OperationContract(Name = "AddProject")]
        [WebInvoke(Method = "GET",
          UriTemplate = "AddProject/{Memberid}/{ProjectName}/{Description}", ResponseFormat = WebMessageFormat.Json)]
        // [OperationContract]
        //[WebGet(UriTemplate = "AddProject/{Memberid}/{ProjectName}/{Description}", ResponseFormat = WebMessageFormat.Json)]
        string AddNewProject(string Memberid, string ProjectName, string Description);

        [OperationContract(Name = "UpdateProject")]
        [WebInvoke(Method = "GET",
          UriTemplate = "UpdateProject/{Id}/{Memberid}/{ProjectName}/{Description}", ResponseFormat = WebMessageFormat.Json)]
        // [OperationContract]
        //[WebGet(UriTemplate = "AddProject/{Memberid}/{ProjectName}/{Description}", ResponseFormat = WebMessageFormat.Json)]
        string UpdateProject(string Id,string Memberid, string ProjectName, string Description);

        [OperationContract(Name = "DeleteProject")]
        [WebInvoke(Method = "GET",
          UriTemplate = "DeleteProject/{Id}/{Memberid}", ResponseFormat = WebMessageFormat.Json)]
        // [OperationContract]
        //[WebGet(UriTemplate = "AddProject/{Memberid}/{ProjectName}/{Description}", ResponseFormat = WebMessageFormat.Json)]
        string DeleteProject(string Id, string Memberid);
        #endregion
        // TASK Contracts
        #region Task
        [OperationContract]
        [WebGet(UriTemplate = "GetTask/{id}/{memberid}", ResponseFormat = WebMessageFormat.Json)]
        string GetTask(string id, string memberid);

         [OperationContract(Name = "AddTask")]
        [WebInvoke(Method = "GET" , UriTemplate = "AddTask/{Task}/{Memberid}/{projectid}/{priorityid}/{description}/{comments}", ResponseFormat = WebMessageFormat.Json)]
        string AddTask(string Task, string Memberid, string projectid, string priorityid, string description, string comments);

         [OperationContract(Name = "DeleteTask")]
         [WebInvoke(Method = "GET", UriTemplate = "DeleteTask/{TaskId}", ResponseFormat = WebMessageFormat.Json)]
         string DeleteTask(string TaskId);


         [OperationContract(Name = "UpdateTaskPriority")]
         [WebInvoke(Method = "GET", UriTemplate = "UpdateTaskPriority/{TaskId}/{Memberid}/{Priorityid}", ResponseFormat = WebMessageFormat.Json)]
         string UpdateTaskPriority(string taskid, string memberid, string Priorityid);

         [OperationContract(Name = "UpdateTaskStatus")]
         [WebInvoke(Method = "GET", UriTemplate = "UpdateTaskStatus/{TaskId}/{Memberid}/{statusid}", ResponseFormat = WebMessageFormat.Json)]
         string UpdateTaskStatus(string taskid, string memberid, string statusid);

         [OperationContract(Name = "TransferTask")]
         [WebInvoke(Method = "GET", UriTemplate = "TransferTask/{TaskId}/{ProjectId}", ResponseFormat = WebMessageFormat.Json)]
         string TransferTask(string taskid, string projectid);

         [OperationContract]
         [WebGet(UriTemplate = "TaskDetails/{id}", ResponseFormat = WebMessageFormat.Json)]
         string TaskDetails(string id);

         [OperationContract(Name = "UpdateTask")]
         [WebInvoke(Method = "GET", UriTemplate = "UpdateTask/{TaskId}/{taskName}/{taskDescription}", ResponseFormat = WebMessageFormat.Json)]
         string UpdateTask(string taskid, string taskName, string taskDescription);

         

        #endregion

        #region PriorityMaster
        [OperationContract]
        [WebGet(UriTemplate = "GetPriority/{memberid}", ResponseFormat = WebMessageFormat.Json)]
        string GetPriority( string memberid);
        #endregion

        #region Status

        [OperationContract]
        [WebGet(UriTemplate = "GetStatus/{memberid}", ResponseFormat = WebMessageFormat.Json)]
        string GetStatus(string memberid);
        #endregion




    }
}
