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
    
    public partial class Notice_Main
    {
        public string FK_NoticeKind { get; set; }
        public int PK_NoticeNo { get; set; }
        public string NoticeAccYear { get; set; }
        public string NoticeTime { get; set; }
        public string StartDay { get; set; }
        public string EndDay { get; set; }
        public string NoticeTitle { get; set; }
        public string NoticeMemo { get; set; }
        public string NoticeUser { get; set; }
    }
}