//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace FunctionGroupMenu.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Pow_User_Func
    {
        public string PK_AccYear { get; set; }
        public int FK_UserNo { get; set; }
        public int FK_FuncNo { get; set; }
        public string UsePermit { get; set; }
        public string AddPermit { get; set; }
        public string EditPermit { get; set; }
        public string DelPermit { get; set; }
        public string PassPermit { get; set; }
    }
}