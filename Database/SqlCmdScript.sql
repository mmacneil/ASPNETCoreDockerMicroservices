use master;
create database [dotnetgigs.applicants];
GO
use [dotnetgigs.applicants];
CREATE TABLE [dbo].[Applicants](
	[ApplicantId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Applicants] PRIMARY KEY CLUSTERED 
(
	[ApplicantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicantSubmissions]    Script Date: 2017-12-15 12:18:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicantSubmissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[ApplicantId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[SubmissionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ApplicantSubmissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicantSubmissions]  WITH CHECK ADD  CONSTRAINT [FK_ApplicantSubmissions_Applicants] FOREIGN KEY([ApplicantId])
REFERENCES [dbo].[Applicants] ([ApplicantId])
GO
ALTER TABLE [dbo].[ApplicantSubmissions] CHECK CONSTRAINT [FK_ApplicantSubmissions_Applicants]
GO

--data 
INSERT INTO Applicants([Name],[Email],[Address],[PhoneNo]) VALUES('Josh Dillinger','josh903902@gmail.com','P.O. Box 184, 8629 A, Ave','1-509-324-5745'),('Vance','erat.nonummy@Nullaaliquet.co.uk','P.O. Box 281, 3168 Nulla Ave','1-451-284-3449'),('Lee','aliquet.lobortis@Nullamut.com','Ap #259-5713 Erat, Avenue','1-526-114-4025'),('Tanisha','Suspendisse.sagittis@mitempor.ca','Ap #220-3725 Donec St.','1-372-601-6991'),('Prescott','Suspendisse.aliquet@incursus.co.uk','P.O. Box 248, 9885 In Rd.','1-443-179-4456'),('Bruce','lectus@arcu.net','Ap #712-620 Cursus. Av.','1-616-100-8361'),('Justin','mollis.dui.in@pede.co.uk','272-6182 Curabitur Rd.','1-441-243-3710'),('Penelope','inceptos.hymenaeos.Mauris@sedtortor.net','892-2321 Sodales. Rd.','1-553-633-7203'),('Amena','bibendum@sapien.co.uk','Ap #291-7263 Feugiat Ave','1-689-762-4168'),('Zenaida','non@risusodio.ca','Ap #922-9109 Neque Ave','1-735-619-7338');
INSERT INTO Applicants([Name],[Email],[Address],[PhoneNo]) VALUES('Micah','penatibus@at.edu','P.O. Box 703, 2230 Fringilla Street','1-441-833-0075'),('Vivian','odio.Aliquam@facilisis.com','937-3205 Elit Rd.','1-269-130-6315'),('Hilel','ultricies.sem@egetipsumSuspendisse.net','P.O. Box 730, 377 Ut, Rd.','1-265-435-5162'),('Joelle','adipiscing.lacus@Nullatempor.net','P.O. Box 200, 3623 Ac Ave','1-774-496-4023'),('Doris','malesuada.fringilla@magnaPhasellus.ca','897-3445 Etiam Ave','1-805-501-1838'),('Madeson','amet@Uttinciduntvehicula.com','7307 Ac Rd.','1-334-730-8395'),('Dalton','ullamcorper.viverra.Maecenas@tempus.edu','Ap #250-6679 Semper Ave','1-932-757-7168'),('Melissa','scelerisque.scelerisque.dui@odioEtiamligula.co.uk','389-1352 Tellus. Street','1-772-921-7051'),('Briar','vitae.purus.gravida@Aliquamerat.edu','958-2858 Quisque Ave','1-907-581-9797'),('Brock','et.ultrices.posuere@velvulputate.co.uk','Ap #351-3919 In, St.','1-812-582-0934');

create database [dotnetgigs.jobs];
GO
use [dotnetgigs.jobs];

CREATE TABLE [dbo].[JobApplicants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[ApplicantId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_JobApplicants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[PostedDate] [datetime] NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobApplicants]  WITH CHECK ADD  CONSTRAINT [FK_JobApplicants_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobApplicants] CHECK CONSTRAINT [FK_JobApplicants_Jobs]
GO

--data 
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Senior Software Engineer','We are seeking a Senior Software Engineer to implement ease-of-use functionality for our integrated IT Risk Management Platform built on .Net, SQL and Angular JS.','HyperSec',getutcdate(),'Toronto, ON')
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Developer (.Net)','Design, implement, debug web-based applications using the appropriate tools and adhering to our coding standards Review project requirements, assess and estimate the necessary time-to-completion Contribute to and lead architecture and design activities Create unit test plans and scenarios for development unit testing Interact with other development teams to carry out code reviews and to ensure a consistent approach to software development Deploy all integration artifacts to a testing and production environment Assist other developers in resolving software development issues Perform additional duties as needed','HyperSec',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('C#/.NET Developer','Help schools and parents in a meaningful way by using your talent as a developer to create real world solutions for their needs. We are looking for a strong C# / .NET Developer to join our product development team responsible for designing then developing new products, as well as improving our current suite of desktop, web, and mobile applications. Some of the technologies we work with are ASP.NET Core / React / Redux, WPF using the MVVM pattern, SOAP / REST based services, and MS-SQL.','Progressive Soft',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Full-Stack Web Developer (ASP.NET Core / React.js / C#)','Help schools and parents in a meaningful way by using your talent as a developer to create real world solutions for their needs. We are looking for a strong Full-Stack Web Developer to join our product development team responsible for designing then developing new products, as well as improving our current suite of application using modern web technologies such as ASP.NET Core 2.0 / Node.js / React / Redux / Bootstrap using C# and TypeScript.  Our intelligent software manages student fees, bills parents, collect payments, synchronizes and transforms data from many different sources, and includes reporting and visualization features. Contribute to project requirements, system architecture, and brainstorm product ideas. Then, build and execute on these as part of a Scrum team using a high-end computer and large screens!','Progressive Soft',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Snr full stack C#.NET Developer','We''re currently looking for a talented Senior Back-End .Net Developer to join our team on a permanent full time position. The ideal candidate will have the opportunity to work for one of the highest grossing E-Tailers in North America.  What you''ll do: Maintain existing CRM, and Web-based applications in VB.NET/ASP.NET. Create user-friendly and process-efficient interfaces and tools for internal staff to access data relevant to our business. Interact with staff to track down bugs, feature requests, and potential improvements to internal applications Assist in IT related activities.','CyMax',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Software Developer/Consultant','Collaborate in small teams to design, build, and deploy quality software solutions for our enterprise customers Help shape our long-term technical roadmap as we scale our infrastructure and build new products Solve complex problems related to development and provide accurate estimates and scope for team deliverables Work independently and be able to effectively communicate verbally and in writing with both our customers and internal teams Perform other job-related duties as assigned, we are a small and growing organization where we are all continuously improving our daily activities to be more productive Needs to be available for occasional travel (BC, Alberta, Washington) Needs to be able to multitask, we are looking for a keen individual ready to learn and adapt to a high paced customer facing position','DMS Group',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Lead Software Developer','Based in Vancouver, the Lead Software Developer will be responsible for bringing creative solutions to complex software requirements as part of a small team of software developers. This individual must understand modern/agile software development lifecycle processes, and enjoy working in a challenging environment to develop web applications, as well as building state of the art software with complex requirements. The successful candidate must have a very good knowledge of C# programming and be an independent, highly-motivated, results-driven individual who has a positive attitude and a willingness to learn.','ComWave',getutcdate(),'Calgary, AB');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Front End Web Developer','MarTec Investigations is seeking a front end web developer with 5+ years of JavaScript development who is proficient in ES6/ES2015 and newer language features. Extensive experience with the React/Redux framework is required. The candidate should also have considerable experience with a Microsoft .Net full stack (ASP.NET MVC/ C# / SQL Server).  The successful candidate will work with the MarTec Data Services team developing geo-spatial visualization applications, reporting and operations management tools and interfaces for access from PC and mobile devices. This is an ideal position for a self-starter who is able to produce results with limited supervision.','MarTec Investigations',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Software Applications, Developer (with .Net Experience)','Analysis, Design, and Development of Software Applications using various software languages and tools like Dot Net and Developing Dot Net Web-based Applications.  Analyze users’ needs by researching through the available documentation and then design, test, and develop the features of the product.  Also perform necessary integration support to the basic product.  Evaluate & recommend software upgrades for existing and prospective customers.  Design each unit at a modular level and plan for unit wise integration of the pieces to ensure that final product works in one single piece.','Marvel Technologies',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Sr. Software Developer','Transform business and system requirements into functional code Contributes to creation of standard approaches and techniques Assist with code quality checks and peer reviews Provide technical software support, including investigating and qualifying bugs, interpreting procedure manuals, and maintaining accurate documentation Out of the box thinking, to identify and work around process design Understand, learn and develop on different robotics tools Involvement in full development life cycle; design, coding, test, build, QA, deployment and maintenance','SmartLink',getutcdate(),'Ottawa, ON');
