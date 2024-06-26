USE [master]
GO
/****** Object:  Database [DoctorDB]    Script Date: 8/22/2023 6:37:15 PM ******/
CREATE DATABASE [DoctorDB]
 
GO
ALTER DATABASE [DoctorDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoctorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoctorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoctorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoctorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoctorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoctorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoctorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoctorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoctorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoctorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoctorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoctorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoctorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoctorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoctorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoctorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DoctorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoctorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoctorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoctorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoctorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoctorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoctorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoctorDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DoctorDB] SET  MULTI_USER 
GO
ALTER DATABASE [DoctorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoctorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoctorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoctorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DoctorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DoctorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DoctorDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [DoctorDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DoctorDB]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 8/22/2023 6:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[patient_name] [varchar](50) NOT NULL,
	[Medical_Issue] [varchar](50) NULL,
	[Doctor_to_Visit] [varchar](50) NULL,
	[Doctor_Avalialbe_Time] [varchar](50) NULL,
	[AppointmentTime] [datetime] NULL,
 CONSTRAINT [PK__Appointm__8ECDFCA2715056A7] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diseases_Doctor_Details]    Script Date: 8/22/2023 6:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diseases_Doctor_Details](
	[DiseasesID] [int] IDENTITY(1,1) NOT NULL,
	[DiseasesName] [varchar](50) NOT NULL,
	[SuitableDoctorId] [int] NULL,
 CONSTRAINT [pk_prim] PRIMARY KEY CLUSTERED 
(
	[DiseasesName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor_Details]    Script Date: 8/22/2023 6:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_Details](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[Specialisation] [varchar](50) NOT NULL,
	[Available_Time] [varchar](50) NOT NULL,
	[Doctor_Fee] [int] NOT NULL,
 CONSTRAINT [PK__Doctor_D__2DC00EDFD4DF1CB0] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (5, N'Amit Sharma', N'Heart Disease', N'Dr. Rajesh Kumar', N'Monday 9:00 AM - 5:00 PM', CAST(N'2023-08-23T10:00:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (6, N'Neha Kapoor', N'Asthma', N'Dr. Ramesh Tiwari', N'Thursday 8:00 AM - 4:00 PM', CAST(N'2023-08-24T14:30:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (7, N'Raj Patel', N'Pediatric Infections', N'Dr. Priya Singh', N'Tuesday 10:00 AM - 6:00 PM', CAST(N'2023-08-25T11:15:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (8, N'Pooja Verma', N'Skin Allergies', N'Dr. Sanjay Patel', N'Wednesday 8:00 AM - 4:00 PM', CAST(N'2023-08-26T08:45:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (9, N'Rajesh Kumar', N'Sports Injuries', N'Dr. Neha Sharma', N'Thursday 9:30 AM - 5:30 PM', CAST(N'2023-08-27T16:20:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (10, N'Aishwarya Singh', N'Pregnancy Care', N'Dr. Alok Verma', N'Friday 10:30 AM - 6:30 PM', CAST(N'2023-08-30T10:50:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (11, N'Manish Gupta', N'Ear Infections', N'Dr. Anika Reddy', N'Monday 11:00 AM - 7:00 PM', CAST(N'2023-08-31T15:40:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (12, N'Sneha Tiwari', N'Neurological Disorders', N'Dr. Sunil Gupta', N'Tuesday 9:00 AM - 5:00 PM', CAST(N'2023-09-01T09:30:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (13, N'Rahul Mehta', N'Eye Conditions', N'Dr. Meena Joshi', N'Wednesday 8:30 AM - 4:30 PM', CAST(N'2023-09-02T12:00:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (14, N'Nisha Sharma', N'Dental Issues', N'Dr. Vinod Khanna', N'Thursday 10:00 AM - 6:00 PM', CAST(N'2023-09-03T14:15:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (15, N'Shiv Kumar', N'Mental Health', N'Dr. Sunita Bansal', N'Friday 9:30 AM - 5:30 PM', CAST(N'2023-09-06T16:45:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (16, N'Sarika Patel', N'Urinary Tract Issues', N'Dr. Rajendra Prasad', N'Monday 10:30 AM - 6:30 PM', CAST(N'2023-09-07T11:30:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (17, N'Rahul Joshi', N'General Health', N'Dr. Anjali Kapoor', N'Tuesday 8:00 AM - 4:00 PM', CAST(N'2023-09-08T10:10:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (18, N'Preeti Verma', N'Heart Surgery', N'Dr. Arvind Jain', N'Wednesday 9:00 AM - 5:00 PM', CAST(N'2023-09-09T13:20:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (19, N'Aditi Reddy', N'Autoimmune Diseases', N'Dr. Meenakshi Rana', N'Thursday 11:00 AM - 7:00 PM', CAST(N'2023-09-10T14:30:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (20, N'Rajesh Khanna', N'Nutrition', N'Dr. Shalini Singh', N'Friday 8:30 AM - 4:30 PM', CAST(N'2023-09-13T09:45:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (21, N'Nandini Gupta', N'Blood Disorders', N'Dr. Karthik Reddy', N'Monday 10:00 AM - 6:00 PM', CAST(N'2023-09-14T12:45:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (22, N'Alok Bansal', N'Digestive Issues', N'Dr. Anil Sharma', N'Tuesday 9:30 AM - 5:30 PM', CAST(N'2023-09-15T15:15:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (23, N'Suman Tiwari', N'Kidney Problems', N'Dr. Preeti Desai', N'Wednesday 10:30 AM - 6:30 PM', CAST(N'2023-09-16T16:30:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (24, N'Ramesh Kumar', N'Respiratory Problems', N'Dr. Ramesh Tiwari', N'Thursday 8:00 AM - 4:00 PM', CAST(N'2023-09-17T09:00:00.000' AS DateTime))
INSERT [dbo].[Appointment] ([AppointmentID], [patient_name], [Medical_Issue], [Doctor_to_Visit], [Doctor_Avalialbe_Time], [AppointmentTime]) VALUES (25, N'Tony', N'General Health', N'Dr. Arvind Jain', N'Wednesday 9:00 AM - 5:00 PM', CAST(N'2023-08-25T14:56:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Diseases_Doctor_Details] ON 

INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (31, N'Allergies', 24)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (9, N'Asthma', 6)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (22, N'Autoimmune Diseases', 19)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (24, N'Blood Disorders', 5)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (29, N'Cancer Treatment', 22)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (17, N'Dental Issues', 14)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (28, N'Diabetes Management', 21)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (25, N'Digestive Issues', 6)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (14, N'Ear Infections', 11)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (16, N'Eye Conditions', 13)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (30, N'Eye Surgery', 23)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (20, N'General Health', 17)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (8, N'Heart Disease', 5)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (21, N'Heart Surgery', 18)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (26, N'Kidney Problems', 7)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (18, N'Mental Health', 15)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (15, N'Neurological Disorders', 12)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (23, N'Nutrition', 20)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (10, N'Pediatric Infections', 7)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (13, N'Pregnancy Care', 10)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (27, N'Respiratory Problems', 8)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (11, N'Skin Allergies', 8)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (12, N'Sports Injuries', 9)
INSERT [dbo].[Diseases_Doctor_Details] ([DiseasesID], [DiseasesName], [SuitableDoctorId]) VALUES (19, N'Urinary Tract Issues', 16)
SET IDENTITY_INSERT [dbo].[Diseases_Doctor_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor_Details] ON 

INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (5, N'Dr. Rajesh Kumar', N'Cardiologist', N'Monday 9:00 AM - 5:00 PM', 500)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (6, N'Dr. Priya Singh', N'Pediatrician', N'Tuesday 10:00 AM - 6:00 PM', 400)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (7, N'Dr. Sanjay Patel', N'Dermatologist', N'Wednesday 8:00 AM - 4:00 PM', 600)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (8, N'Dr. Neha Sharma', N'Orthopedic Surgeon', N'Thursday 9:30 AM - 5:30 PM', 550)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (9, N'Dr. Alok Verma', N'Gynecologist', N'Friday 10:30 AM - 6:30 PM', 450)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (10, N'Dr. Anika Reddy', N'ENT Specialist', N'Monday 11:00 AM - 7:00 PM', 550)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (11, N'Dr. Sunil Gupta', N'Neurologist', N'Tuesday 9:00 AM - 5:00 PM', 700)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (12, N'Dr. Meena Joshi', N'Ophthalmologist', N'Wednesday 8:30 AM - 4:30 PM', 400)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (13, N'Dr. Vinod Khanna', N'Dentist', N'Thursday 10:00 AM - 6:00 PM', 300)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (14, N'Dr. Sunita Bansal', N'Psychiatrist', N'Friday 9:30 AM - 5:30 PM', 600)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (15, N'Dr. Rajendra Prasad', N'Urologist', N'Monday 10:30 AM - 6:30 PM', 750)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (16, N'Dr. Anjali Kapoor', N'General Physician', N'Tuesday 8:00 AM - 4:00 PM', 350)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (17, N'Dr. Arvind Jain', N'Cardiac Surgeon', N'Wednesday 9:00 AM - 5:00 PM', 800)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (18, N'Dr. Meenakshi Rana', N'Rheumatologist', N'Thursday 11:00 AM - 7:00 PM', 600)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (19, N'Dr. Shalini Singh', N'Dietitian', N'Friday 8:30 AM - 4:30 PM', 250)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (20, N'Dr. Karthik Reddy', N'Hematologist', N'Monday 10:00 AM - 6:00 PM', 700)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (21, N'Dr. Anil Sharma', N'Gastroenterologist', N'Tuesday 9:30 AM - 5:30 PM', 650)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (22, N'Dr. Preeti Desai', N'Nephrologist', N'Wednesday 10:30 AM - 6:30 PM', 700)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (23, N'Dr. Ramesh Tiwari', N'Pulmonologist', N'Thursday 8:00 AM - 4:00 PM', 600)
INSERT [dbo].[Doctor_Details] ([DoctorID], [DoctorName], [Specialisation], [Available_Time], [Doctor_Fee]) VALUES (24, N'Dr. Kavita Singh', N'Dermatologist', N'Friday 9:00 AM - 5:00 PM', 550)
SET IDENTITY_INSERT [dbo].[Doctor_Details] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK__Appointme__Medic__47DBAE45] FOREIGN KEY([Medical_Issue])
REFERENCES [dbo].[Diseases_Doctor_Details] ([DiseasesName])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK__Appointme__Medic__47DBAE45]
GO
ALTER TABLE [dbo].[Diseases_Doctor_Details]  WITH CHECK ADD  CONSTRAINT [FK__Diseases___Suita__398D8EEE] FOREIGN KEY([SuitableDoctorId])
REFERENCES [dbo].[Doctor_Details] ([DoctorID])
GO
ALTER TABLE [dbo].[Diseases_Doctor_Details] CHECK CONSTRAINT [FK__Diseases___Suita__398D8EEE]
GO
/****** Object:  StoredProcedure [dbo].[DoctorDetailsSp]    Script Date: 8/22/2023 6:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoctorDetailsSp] @DiseaseName varchar(100)
as
declare
	@DoctorId int = null
begin

	Select @DoctorId = doctors.DoctorID from [dbo].[Doctor_Details] as doctors 
	Inner Join [dbo].[Diseases_Doctor_Details] as diseases on doctors.DoctorID = diseases.SuitableDoctorId
	where diseases.DiseasesName=@DiseaseName

	select * from Doctor_Details where DoctorID = @DoctorId
end
GO
USE [master]
GO
ALTER DATABASE [DoctorDB] SET  READ_WRITE 
GO
