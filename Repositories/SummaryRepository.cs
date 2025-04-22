using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using sky_webapi;
using sky_webapi.Data;
using sky_webapi.Data.Entities;

namespace sky_webapi.Repositories
{
    public class SummaryRepository : ISummaryRepository
    {
        private readonly AppDbContext _context;

        public SummaryRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Summary>> GetSummariesAsync()
        {
            return await _context.Summaries.ToListAsync();
        }

        public async Task<Summary?> GetSummaryAsync(int id)
        {
            return await _context.Summaries.FindAsync(id);
        }

        public async Task AddSummaryAsync(Summary summary)
        {
            await _context.Summaries.AddAsync(summary);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateSummaryAsync(Summary summary)
        {
            _context.Entry(summary).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteSummaryAsync(int id)
        {
            var summary = await _context.Summaries.FindAsync(id);
            if (summary != null)
            {
                _context.Summaries.Remove(summary);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<bool> SummaryExistsAsync(int id)
        {
            return await _context.Summaries.AnyAsync(e => e.Id == id);
        }
    }
}
