using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sky_webapi.Data.Entities
{
    public class Inspection
    {
        [Key]
        public int UniqueRef { get; set; }
        public int? HoldingID { get; set; }
        public DateTime? InspectionDate { get; set; }
        public string? Location { get; set; }
        public string? RecentCheck { get; set; }
        public string? PreviousCheck { get; set; }
        public string? SafeWorking { get; set; }
        public string? Defects { get; set; }
        public string? Rectified { get; set; }
        public DateTime? LatestDate { get; set; }
        public string? TestDetails { get; set; }        public string? MiscNotes { get; set; }
        public int? InspectorID { get; set; }

        // Navigation properties
        [ForeignKey("HoldingID")]
        public virtual PlantHolding? PlantHolding { get; set; }
        
        [ForeignKey("InspectorID")]
        public virtual InspectorEntity? Inspector { get; set; }
    }
}
