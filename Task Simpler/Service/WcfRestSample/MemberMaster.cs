//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WcfRestSample
{
    using System;
    using System.Collections.Generic;
    
    public partial class MemberMaster
    {
        public MemberMaster()
        {
            this.Tasks = new HashSet<Task>();
        }
    
        public int MemberID { get; set; }
        public string LoginName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public Nullable<decimal> Mobile { get; set; }
        public string EmailAddress { get; set; }
        public Nullable<System.DateTime> Addedon { get; set; }
    
        public virtual ICollection<Task> Tasks { get; set; }
    }
}
