using DoctorAppointmentPortal.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace DoctorAppointmentPortal.DataAccess
{
    public class DiseasesDoctorDetailsService : IDiseasesDoctorDetailsService
    {
        //Instantiating a database context.
        //This action involves the creation of an object that establishes a connection to a database,
        //allowing for interactions such as querying or modifying data within the database.

        private readonly DoctorAppointmentContext _context;

        public DiseasesDoctorDetailsService(DoctorAppointmentContext context)
        {
            _context = context;
        }
        public async Task<List<DiseasesDoctorDetail>> GetDiseasesDoctorDetailsAsync()
        {
            //Retrieving a collection of diseases associated with doctors from the database.
            //This operation involves obtaining a list of medical conditions and the corresponding doctors who specialize in treating them, as stored in the database.

            var ddd = await _context.DiseasesDoctorDetails.Include(d => d.SuitableDoctor).ToListAsync();
            return ddd;
        }

        public async Task CreateDiseasesDoctorAsync(DiseasesDoctorDetail diseasesDoctorDetail)
        {
            //Inserting a fresh disease associated with a doctor.
            //In this context, it means creating a new entry in a database to link a specific medical condition with a particular doctor who specializes in treating it.

            _context.Add(diseasesDoctorDetail);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteDiseasesDoctorAsync(DiseasesDoctorDetail? diseasesDoctorDetail)
        {

            if (diseasesDoctorDetail != null) 
            {
                //Deleting a disease entry when a non-null object is provided.
                //This action involves the removal of a disease-related record from a database, but only if a valid object containing information about that disease is supplied for the operation.

                _context.DiseasesDoctorDetails.Remove(diseasesDoctorDetail);
            }

            //Persisting data to the database.
            //In this context, it refers to the process of saving or recording information into the database system,
            //ensuring that any changes or additions made are securely stored and can be retrieved as needed in the future.

            await _context.SaveChangesAsync();
        }

        public async Task<DiseasesDoctorDetail?> DiseasesDoctorDetailsAsync(string? id)
        {
            //Retrieving information about diseases associated with doctors by providing the disease name as input.
            //In this context, it involves querying the database for details of medical conditions and their corresponding physicians,
            //specifically when you provide the name of the disease.

            return await _context.DiseasesDoctorDetails
                .Include(d => d.SuitableDoctor)
                .FirstOrDefaultAsync(m => m.DiseasesName == id);
        }


        public async Task EditDiseasesDoctorAsync(DiseasesDoctorDetail diseasesDoctorDetail)
        {
            //Modifying disease-related information.
            //In this context, it entails making changes to the details or attributes associated with a specific medical condition stored in a database.

            _context.Update(diseasesDoctorDetail);
            await _context.SaveChangesAsync();
        }

        public SelectList Create()
        {
            //Retrieving information about doctors and generating a dropdown list.
            //This action involves obtaining data related to healthcare providers and creating a selectable list,
            //typically for users to choose from when selecting a doctor for a particular purpose.

            return new SelectList(_context.DoctorDetails, "DoctorId", "DoctorId");
        }

        public SelectList CreatePost(DiseasesDoctorDetail diseasesDoctorDetail)
        {
            return new SelectList(_context.DoctorDetails, "DoctorId", "DoctorId", diseasesDoctorDetail.SuitableDoctorId);
        }
    }
}
