using Humanizer;
using DoctorAppointmentPortal.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Numerics;

namespace DoctorAppointmentPortal.DataAccess
{
    public class DoctorDetailsService : IDoctorDetailsService
    {
        //Instantiating a database context.
        //This action involves the creation of an object representing the connection to a database,
        //allowing for interactions with the database, such as querying or modifying data within it.

        private readonly DoctorAppointmentContext _context;

        public DoctorDetailsService(DoctorAppointmentContext context)
        {
            _context = context;
        }

        public async Task<List<DoctorDetail>> GetDoctorDetailsAsync()
        {
           
           // Retrieving a collection of doctor information from the database.
           // This operation involves obtaining a list of details related to medical practitioners stored in the database.

            if (_context.DoctorDetails != null)
                return await _context.DoctorDetails.ToListAsync();
            return null;
        }

        public async Task CreateDoctorAsync(DoctorDetail doctorDetail)
        {
            //Inserting a fresh record for doctor details.
            //In this context, it means creating a new entry in a database table to store information about a newly added doctor,
            //including their name, specialization, availability, and fees.

            _context.Add(doctorDetail);
            await _context.SaveChangesAsync();
        }

        public async Task<DoctorDetail?> DoctorDetailsAsync(int? id)
        {
            //Fetching a solitary doctor details entry based on a provided DoctorID.
            //This action involves retrieving specific information about a doctor stored in a database by specifying their unique identification number (DoctorID).

            if (_context.DoctorDetails != null)
                return await _context.DoctorDetails.FirstOrDefaultAsync(m => m.DoctorId == id);
            return null;
        }

        public async Task EditDoctorAsync(DoctorDetail doctorDetail)
        {
            //Updating a doctor's record by passing the entire doctor object.
            //This operation involves modifying the details of a healthcare provider in the database by providing a complete set of data for that doctor,
            //which can include their name, specialization, availability, and fees, among other information.

            _context.Update(doctorDetail);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteDoctorAsync(DoctorDetail? doctorDetail)
        {
            
            //Deleting a doctor's record by providing the complete doctor object as input.
            //In this context, it means removing all information related to a healthcare provider from the database when a comprehensive set of data for that doctor is supplied.

            if (doctorDetail != null)
            {
                _context.DoctorDetails.Remove(doctorDetail);
            }

            await _context.SaveChangesAsync();
        }
    }
}