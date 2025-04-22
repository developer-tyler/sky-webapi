using sky_webapi.Data.Entities;

namespace sky_webapi.Repositories
{
    public interface IPlantCategoryRepository
    {
        Task<IEnumerable<PlantCategoryEntity>> GetAllAsync();
        Task<PlantCategoryEntity?> GetByIdAsync(int id);
        Task<PlantCategoryEntity> AddAsync(PlantCategoryEntity category);
        Task UpdateAsync(PlantCategoryEntity category);
        Task DeleteAsync(int id);
    }
}
