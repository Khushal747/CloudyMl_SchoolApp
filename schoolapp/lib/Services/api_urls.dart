class ApiUrl {
  // static const String baseUrl =  "us-central1-school-app-94046.cloudfunctions.net";
  // static const String login = "/createLogin/login";

  static const String baseUrl = "13.232.53.26:3000";
  static const String login = "/login";
  static const String teacherlogin = "/login";
  static const String studentlogin = "/login";










// Attendance...................................................................

  static const String studentListForTakeAttendance =
      "/getStudentListforAttendance";

  static const String teacherSubmitAttendance = "/createAttendance";

  static const String weekStudentAttendance = "/getWeeklyAttendanceByName";
  static const String monthStudentAttendance = "/getMonthlyAttendanceByName";
  static const String dailyRoutine = "/getWeeklyTimeTable";
  static const String teacherUploadAssignment = "/teacher";
  static const String studentPendingAssignment = "/student";
  static const String studentUploadAssignment = "/student";
  static const String teacherSeeOwnUploadedAssignments =
      "/teacher/assignmentList";
  static const String teacherSeeSubmittedStudentsAssignments = "/teacher";
  static const String studentSubmittedAssignment = "/student";
  static const String studentFeeDetails = "/getFees";
  static const String teacherUploadFees = "/addFees";
  static const String teacherUpdateFees = "/updateFees";
  static const String teacherDeleteFees = "/deleteFees";
  static const String teacherAttendanceSubmit = "/createAttendance";
  static const String uploadGallery = "/uploadGallery";
  static const String viewSchoolGallery = "/getGallery";
  static const String viewSchoolEvents = "/getEventsByStatus";
  static const String teacherUploadEvents = "/uploadMult";
  static const String studentViewAwards = "/getAllAwards";
  static const String teacherUploadAwards = "/createAward";

  // Update my account details..................................................
  static const String updateMytAccountStudent = "/updateStudentById";
  static const String updateMytAccountTeacher = "/updateTeacherById";
  //............................................................................
  static const String studentEligibilityCheckForEnrollEvents =
      "/verifyEventWithStudent";
  static const String studentRegisterEventPost = "/createEventRegister";

  // Awards....................................................................
  static const String classWiseAwardsListOfStudents =
      "/getAllAwardListforSection";

  // Notice.............................................................................

  static const String viewNotice = "/getAllNotice";
  static const String verifyReadUnreadNotice = "/notice-read";

  // Eventts...........................................................................
  static const String getRegisteredStudentListEvents = "/getEventRegister";
  static const String studentSeeMyEnrolledEvents = "/getAllEventsOfStudents";

  // Notice.........................................................................

  static const String teacherUploadNotice = "/createNotice";

  // Result..........................................................................

  static const String studentSeeResult = "/studentSeeResult";
  static const String uploadResult = "/createResult";
  static const String teacherViewReqsultClassWise = "/getClassResult";

  // Exam........................................................................

  static const String viewExamRoutine = "/getExamDetails";
  static const String uploadExamRoutine = "/createExamSchedule";

  //About School.................................................................

  static const String viewAboutSchool = "/getAbout-us";




  //children Data..................................................................
   static const String childrenDataById = "/getStudentfromParent";
}
