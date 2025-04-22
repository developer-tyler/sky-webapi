using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace sky_webapi.Data.Entities
{
    public class NoteEntity
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int NoteID { get; set; }

        public int? CustID { get; set; }

        public DateTime? Date { get; set; }

        public string? Notes { get; set; }

        [ForeignKey("CustID")]
        public virtual CustomerEntity? Customer { get; set; }
    }
}
