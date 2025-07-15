-- Gender, Parental Education Level
-- Extra-Curricular Activities, Part-Time Job, Diet Quality, 

-- Exercise Frequency Group (0-2, 3-4, 5-6)
-- Attendance Percentage Group (56-66, 66-76, 76-86, >86)
--  Study Hours Group (0-2, 3-4, 5-6, >6), Sleep Hours Group(3-5, 6-8, >8)

-- Count of Students, Average Exam Scores, Average Exercise Frequency
-- Average Attendance Percentage, Average Study Hours, Average Sleep Hours

SELECT 
	gender, 
    parental_education_level, 
    extracurricular_participation, 
    part_time_job, 
    diet_quality, 
    case 
     when exercise_frequency <= 2 then '0-2'
     when exercise_frequency <= 4 then '2-4'
     when exercise_frequency > 4 then '> 4'
	end as exercise_frequency_group, 
    
	case 
     when attendance_percentage <= 66 then '0-66'
     when attendance_percentage <= 76 then '66-76'
     when attendance_percentage <= 86 then '76-86'
     when attendance_percentage > 86 then '> 86'
	end as attendance_percentage_group,
    
    case 
     when study_hours_per_day <= 2 then '0-2'
     when study_hours_per_day <= 4 then '2-4'
     when study_hours_per_day <= 6 then '4-6'
     when study_hours_per_day > 6 then '> 6'
	end as study_hours_per_day_group,
    
     case 
     when sleep_hours <= 5 then '0-5'
     when sleep_hours <= 8 then '5-8'
     when sleep_hours > 8 then '> 8'
	end as sleep_hours_group, 
    count(student_id) as count_of_students,
    round(avg(exam_score),2) as avg_exam_score,
    round(avg(exercise_frequency),2) as avg_exercise_frequency, 
    round(avg(attendance_percentage),2) as avg_attendance_percentage, 
    round(avg(study_hours_per_day),2) as avg_study_hours, 
    round(avg(sleep_hours),2) as avg_sleep_hours
     
FROM student_habits.student_habits_performance
group by 1,2,3,4,5,6,7,8,9;