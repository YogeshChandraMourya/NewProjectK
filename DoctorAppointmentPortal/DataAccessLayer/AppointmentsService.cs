using Humanizer;
using DoctorAppointmentPortal.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using System.Numerics;
using System;
using System.Threading.Channels;

namespace DoctorAppointmentPortal.DataAccess
{
    public class AppointmentsService : IAppointmentsService
    {
        //Database context instace creation

        private readonly DoctorAppointmentContext _context;
        public AppointmentsService(DoctorAppointmentContext context)
        {
            _context = context;
        }
        public async Task<Appointment?> AppointmentDetailsAsync(int? id)
        {
            //Verifying the existence of appointment context. Confirming the presence of scheduled appointments and gathering additional information.

            if (_context.Appointments != null)

                //Returning Appointment details

                return await _context.Appointments
                     .Include(a => a.MedicalIssueNavigation)
                     .FirstOrDefaultAsync(m => m.AppointmentId == id);
            return null;
        }

        public SelectList CreateList(Appointment appointment)
        {
            //Retrieving the names of medical conditions and generating a dropdown list for selection. Providing an option for users to choose from a list of available diseases.

            return new SelectList(_context.DiseasesDoctorDetails, "DiseasesName", "DiseasesName", appointment.MedicalIssue);
        }

        public async Task CreateAppointmentAsync(Appointment appointment)
        {
            //Scheduling a new appointment. Expanding on the previous statement,
            //this involves the process of setting up a new medical appointment, which typically includes specifying a patient's details,
            //the doctor to visit, the reason for the appointment, and the appointment time and date.

            _context.Add(appointment);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAppointmentAsync(Appointment? appointment)
        {
            if (appointment != null)
            {
                //Canceling an appointment when the appointment model is not empty.
                //This action involves the deletion of a scheduled appointment if the appointment data contains valid information,
                //such as patient details, the assigned doctor, and the appointment date and time.

                _context.Appointments.Remove(appointment);
            }

            
            //Persisting data to the database.Expanding on the previous statement,
            //this step involves saving or recording information into the database system,
            //ensuring that any changes or additions made, such as appointments or updates to patient records,
            //are securely stored and can be retrieved as needed in the future.

            await _context.SaveChangesAsync();
        }
        public async Task EditAppointmentAsync(Appointment appointment)
        {
            //Modifying an existing appointment.
            //Adding more context, this action entails making changes to a previously scheduled appointment,
            //which could include adjusting the appointment time, updating patient information,
            //or assigning a different doctor.
            //These updates are typically made to accommodate changes in a patient's schedule or medical needs.

            _context.Update(appointment);
            await _context.SaveChangesAsync();
        }
        public async Task<List<Appointment>> GetAppointmentsAsync()
        {
            if (_context.Appointments != null)
            {
                //Retrieving a collection of appointments from the database if there is valid appointment context.
                //In this scenario, we aim to obtain a list of scheduled appointments,
                //provided that there is relevant and meaningful appointment information available.

                var AppointDetails = await _context.Appointments.Include(a => a.MedicalIssueNavigation).ToListAsync();
                return AppointDetails;
            }
            return null;
        }

        public DoctorDetail GetDoctorData(string? disease)
        {
            //Running a stored procedure that accepts a disease name as input and returns a Doctor model associated with the corresponding disease ID.
            //In essence, this involves invoking a predefined database procedure where you provide a medical condition's name,
            //and it responds with information about the doctor linked to that specific condition.

            SqlParameter param = new SqlParameter("@DiseaseName", disease);
            DoctorDetail doctor = _context.Set<DoctorDetail>().FromSqlRaw("exec DoctorDetailsSp @DiseaseName", param).AsEnumerable().FirstOrDefault();
            return doctor;
        }

        public SelectList CreateListGet()
        {
            return new SelectList(_context.DiseasesDoctorDetails, "DiseasesName", "DiseasesName");

        }
    }
}
