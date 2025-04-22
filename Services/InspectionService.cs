using sky_webapi.Data.Entities;
using sky_webapi.DTOs;
using sky_webapi.Repositories;

namespace sky_webapi.Services
{
    public class InspectionService : IInspectionService
    {
        private readonly IInspectionRepository _repository;

        public InspectionService(IInspectionRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<InspectionReadDto>> GetAllInspectionsAsync()
        {
            var inspections = await _repository.GetAllAsync();
            return inspections.Select(MapToReadDto);
        }

        public async Task<InspectionReadDto?> GetInspectionByIdAsync(int id)
        {
            var inspection = await _repository.GetByIdAsync(id);
            return inspection != null ? MapToReadDto(inspection) : null;
        }

        public async Task<IEnumerable<InspectionReadDto>> GetInspectionsByPlantHoldingAsync(int holdingId)
        {
            var inspections = await _repository.GetByPlantHoldingAsync(holdingId);
            return inspections.Select(MapToReadDto);
        }

        public async Task<InspectionReadDto> CreateInspectionAsync(InspectionDto inspectionDto)
        {
            var inspection = new Inspection
            {
                HoldingID = inspectionDto.HoldingID,
                InspectionDate = inspectionDto.InspectionDate,
                Location = inspectionDto.Location,
                RecentCheck = inspectionDto.RecentCheck,
                PreviousCheck = inspectionDto.PreviousCheck,
                SafeWorking = inspectionDto.SafeWorking,
                Defects = inspectionDto.Defects,
                Rectified = inspectionDto.Rectified,
                LatestDate = inspectionDto.LatestDate,
                TestDetails = inspectionDto.TestDetails,                MiscNotes = inspectionDto.MiscNotes,
                InspectorID = inspectionDto.InspectorID
            };

            var result = await _repository.AddAsync(inspection);
            var createdInspection = await _repository.GetByIdAsync(result.UniqueRef);
            return MapToReadDto(createdInspection!);
        }

        public async Task<InspectionReadDto> UpdateInspectionAsync(int id, InspectionDto inspectionDto)
        {
            var inspection = new Inspection
            {
                UniqueRef = id,
                HoldingID = inspectionDto.HoldingID,
                InspectionDate = inspectionDto.InspectionDate,
                Location = inspectionDto.Location,
                RecentCheck = inspectionDto.RecentCheck,
                PreviousCheck = inspectionDto.PreviousCheck,
                SafeWorking = inspectionDto.SafeWorking,
                Defects = inspectionDto.Defects,
                Rectified = inspectionDto.Rectified,
                LatestDate = inspectionDto.LatestDate,                TestDetails = inspectionDto.TestDetails,
                MiscNotes = inspectionDto.MiscNotes,
                InspectorID = inspectionDto.InspectorID
            };

            await _repository.UpdateAsync(inspection);
            var updatedInspection = await _repository.GetByIdAsync(id);
            return MapToReadDto(updatedInspection!);
        }

        public async Task DeleteInspectionAsync(int id)
        {
            await _repository.DeleteAsync(id);
        }

        private static InspectionReadDto MapToReadDto(Inspection inspection)
        {
            return new InspectionReadDto
            {
                UniqueRef = inspection.UniqueRef,
                HoldingID = inspection.HoldingID,
                InspectionDate = inspection.InspectionDate,
                Location = inspection.Location,
                RecentCheck = inspection.RecentCheck,
                PreviousCheck = inspection.PreviousCheck,
                SafeWorking = inspection.SafeWorking,
                Defects = inspection.Defects,
                Rectified = inspection.Rectified,
                LatestDate = inspection.LatestDate,
                TestDetails = inspection.TestDetails,
                MiscNotes = inspection.MiscNotes,
                PlantDescription = inspection.PlantHolding?.Plant?.PlantDescription,
                CategoryDescription = inspection.PlantHolding?.Plant?.Category?.CategoryDescription,                SerialNumber = inspection.PlantHolding?.SerialNumber,
                // Map inspector data
                InspectorID = inspection.InspectorID,
                InspectorsName = inspection.Inspector?.InspectorsName,
                // Map customer data
                CustID = inspection.PlantHolding?.Customer?.CustID,
                CompanyName = inspection.PlantHolding?.Customer?.CompanyName,
                ContactTitle = inspection.PlantHolding?.Customer?.ContactTitle,
                ContactFirstNames = inspection.PlantHolding?.Customer?.ContactFirstNames,
                ContactSurname = inspection.PlantHolding?.Customer?.ContactSurname,
                Line1 = inspection.PlantHolding?.Customer?.Line1,
                Line2 = inspection.PlantHolding?.Customer?.Line2,
                Line3 = inspection.PlantHolding?.Customer?.Line3,
                Line4 = inspection.PlantHolding?.Customer?.Line4,
                Postcode = inspection.PlantHolding?.Customer?.Postcode,
                Telephone = inspection.PlantHolding?.Customer?.Telephone,
                Email = inspection.PlantHolding?.Customer?.Email
            };
        }
    }
}
