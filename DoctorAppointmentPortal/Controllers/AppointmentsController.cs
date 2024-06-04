﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DoctorAppointmentPortal.Models;
using DoctorAppointmentPortal.DataAccess;
using System.Data.Entity;

namespace DoctorAppointmentPortal.Controllers
{
    public class AppointmentsController : Controller
    {
        private readonly IAppointmentsService _appointmentsService;

        public AppointmentsController(IAppointmentsService appointmentsService)
        {
            _appointmentsService = appointmentsService;
        }

        // GET: Appointments

        public IActionResult GetData(IFormCollection data)
        {
            string disease = data["Disease"];
            DoctorDetail doctor = _appointmentsService.GetDoctorData(disease);
            return Json(new { doctorname = doctor.DoctorName, timeslot = doctor.AvailableTime });
        }

        public async Task<IActionResult> Index()
        {
            return View(await _appointmentsService.GetAppointmentsAsync());
        }

        // GET: Appointments/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appointment = await _appointmentsService.AppointmentDetailsAsync(id);
            if (appointment == null)
            {
                return NotFound();
            }

            return View(appointment);
        }

        // GET: Appointments/Create
        public IActionResult Create()
        {
            ViewData["MedicalIssue"] = _appointmentsService.CreateListGet();
            return View();
        }

        // POST: Appointments/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AppointmentId,PatientName,MedicalIssue,DoctorToVisit,DoctorAvalialbeTime,AppointmentTime")] Appointment appointment)
        {
            try
            {

                await _appointmentsService.CreateAppointmentAsync(appointment);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                ViewData["MedicalIssue"] = _appointmentsService.CreateList(appointment);
                return View(appointment);
            }


        }

        // GET: Appointments/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appointment = await _appointmentsService.AppointmentDetailsAsync(id);
            if (appointment == null)
            {
                return NotFound();
            }
            ViewData["MedicalIssue"] = _appointmentsService.CreateList(appointment);
            return View(appointment);
        }

        // POST: Appointments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AppointmentId,PatientName,MedicalIssue,DoctorToVisit,DoctorAvalialbeTime,AppointmentTime")] Appointment appointment)
        {
            if (id != appointment.AppointmentId)
            {
                return NotFound();
            }

            try
            {
                _appointmentsService.EditAppointmentAsync(appointment);
                return RedirectToAction(nameof(Index));
            }
            catch (DbUpdateConcurrencyException)
            {
                ViewData["MedicalIssue"] = _appointmentsService.CreateList(appointment);
                return View(appointment);
            }

        }

        // GET: Appointments/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var appointment = await _appointmentsService.AppointmentDetailsAsync(id);
            if (appointment == null)
            {
                return NotFound();
            }

            return View(appointment);
        }

        // POST: Appointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {

            var appointment = await _appointmentsService.AppointmentDetailsAsync(id);
            _appointmentsService.DeleteAppointmentAsync(appointment);
            return RedirectToAction(nameof(Index));
        }

        
    }
}
