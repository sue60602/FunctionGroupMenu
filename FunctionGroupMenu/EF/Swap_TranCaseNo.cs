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
    
    public partial class Swap_TranCaseNo
    {
        public string PK_AccYear { get; set; }
        public string FK_FundNo { get; set; }
        public string FK_UnitNo { get; set; }
        public string PK_MethodKind { get; set; }
        public string PK_VouKind { get; set; }
        public int PK_AccMainNo { get; set; }
        public string VouNo { get; set; }
        public string AccState { get; set; }
        public string CaseNo { get; set; }
        public string CaseFlag { get; set; }
        public string PreCaseNo { get; set; }
        public string ReturnState { get; set; }
        public string CreateTime { get; set; }
    }
}