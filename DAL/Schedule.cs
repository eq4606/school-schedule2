//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Schedule
    {
        public int Num { get; set; }
        public int GroupId { get; set; }
        public int WeekDay { get; set; }
        public int Day { get; set; }
        public int Hour { get; set; }
        public Nullable<decimal> CalculateHours { get; set; }
        public Nullable<int> Cause { get; set; }
    
        public virtual Room Room1 { get; set; }
    }
}
