using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfRestSample
{

    [ServiceContract]

    public interface IBookService
    {
        [OperationContract]
        [WebGet]
        List<Book> GetBooksList();

        [OperationContract]

        [WebGet(UriTemplate = "GetProjects/{id}", ResponseFormat = WebMessageFormat.Json)]
        string GetProjects(string id);

        [OperationContract]

        [WebGet(UriTemplate = "Book/{id}", ResponseFormat = WebMessageFormat.Json)]
        Book GetBookById(string id);

       [OperationContract(Name = "AddBook")]
       [WebInvoke(Method = "GET",
         UriTemplate = "AddBook/{name}")]
        //[WebInvoke(UriTemplate = "AddBook/{name}")]
        void AddBook(string name);

       [OperationContract(Name = "UpdateBook")]
        [WebInvoke(Method = "GET",
        UriTemplate = "UpdateBook/{id}/{name}")]
        void UpdateBook(string id, string name);

        [OperationContract]
        [WebInvoke(UriTemplate = "DeleteBook/{id}")]
        void DeleteBook(string id);

        [OperationContract]
        [WebGet(ResponseFormat=WebMessageFormat.Json)]
        string GetBooksNames();
    }
}
