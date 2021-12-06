CREATE TABLE `students` (
  `idstudents` int NOT NULL,
  `student_name` varchar(100) NOT NULL,
  PRIMARY KEY (`idstudents`),
  KEY `takes_idx` (`student_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `professors` (
  `idprofessors` int NOT NULL,
  `professors_name` varchar(100) NOT NULL,
  PRIMARY KEY (`idprofessors`),
  KEY `Grades_idx` (`professors_name`,`idprofessors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `grades` (
  `grades_id` int NOT NULL,
  `grades_professor_id` int NOT NULL,
  `grades_student_id` int NOT NULL,
  `grades_course_id` int NOT NULL,
  `grades_grade_id` int NOT NULL,
  PRIMARY KEY (`grades_id`),
  KEY `students_grades_idx` (`grades_id`,`grades_professor_id`,`grades_student_id`,`grades_grade_id`),
  KEY `grades_professor_id_idx` (`grades_professor_id`),
  KEY `grades_student_id_idx` (`grades_student_id`),
  KEY `grades_course_id_idx` (`grades_course_id`),
  CONSTRAINT `grades_course_id` FOREIGN KEY (`grades_course_id`) REFERENCES `courses` (`idcourses`),
  CONSTRAINT `grades_professor_id` FOREIGN KEY (`grades_professor_id`) REFERENCES `professors` (`idprofessors`),
  CONSTRAINT `grades_student_id` FOREIGN KEY (`grades_student_id`) REFERENCES `students` (`idstudents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `courses` (
  `idcourses` int NOT NULL,
  `course_professor_id` int DEFAULT NULL,
  `course_student_id` int DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcourses`),
  KEY `course_professor_id_idx` (`course_professor_id`),
  KEY `course_student_id_idx` (`course_student_id`),
  CONSTRAINT `course_professor_id` FOREIGN KEY (`course_professor_id`) REFERENCES `professors` (`idprofessors`),
  CONSTRAINT `course_student_id` FOREIGN KEY (`course_student_id`) REFERENCES `students` (`idstudents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci