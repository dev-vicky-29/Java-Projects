<%@page import="java.sql.ResultSet"%>
<%@ include file="cheader.jsp" %>
<style>
table, th, td {
  border: 3px solid black;
  border-collapse: collapse;
}
</style>
<br>
<section>
		<div class="container">
			
				<h3>Model Gym Schedule Table for Fit Body and  Weight Loss</h3>
						<table style="width:100%">
						
						<tr>
						<td></td>
						<th>Exercise</th>
						<td>Muscle Group</td>
						<td>Sets</td>
						<td>Reps</td>
						<td>Rest</td>
						</tr>
						
						<tr>
						<td rowspan="6">Monday</td>
						<td>Lateral Raises</td>
						<td>Shoulders</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Front Raises</td>
						<td>Shoulders</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Front Lunges</td>
						<td>Quads & Gluets</td>
						<td>3</td>
						<td>12-15</td>
						<td>1 minute</td>
						</tr>
						<tr>
						<td>Squats</td>
						<td>Quads & Gluets</td>
						<td>3</td>
						<td>12-15</td>
						<td>1 minute</td>
						</tr>
						<tr>
						<td>Ankle Crunches</td>
						<td>Abdominals</td>
						<td>3</td>
						<td>30</td>
						<td>10 seconds</td>
						</tr>
						<tr>
						<td>Alternating knee Tucks</td>
						<td>Abdominals</td>
						<td>3</td>
						<td>30</td>
						<td>10 seconds</td>
						</tr>
						
						<tr>
						<td rowspan="5">Tuesday</td>
						<td>Flyes on swiss ball</td>
						<td>Chest</td>
						<td>3</td>
						<td>12</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Chest press on swiss ball</td>
						<td>Chest</td>
						<td>3</td>
						<td>12</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Triceps kickbacks</td>
						<td>Triceps</td>
						<td>3</td>
						<td>12</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Dips</td>
						<td>Triceps</td>
						<td>3</td>
						<td>12</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td colspan="5">Interval Trainning</td>
						
						</tr>
						<tr>
						<td rowspan="4">Wednesday</td>
						<td>Push-Ups</td>
						<td>Entire Upper Body</td>
						<td>3</td>
						<td>To failure</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Revenge lrg curls</td>
						<td>Hams & Gluets</td>
						<td>3</td>
						<td>15 each leg</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Alternating lg raises</td>
						<td>Abdominals</td>
						<td>2</td>
						<td>30</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Twist & Slap</td>
						<td>Abs/Obliques</td>
						<td>2</td>
						<td>30</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td rowspan="5">Thursday</td>
						<td>Hammer Curls</td>
						<td>Biceps</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Bicep Curls</td>
						<td>Biceps</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						
						</tr>
						<tr>
						<td>One arm rows</td>
						<td>Back</td>
						<td>3</td>
						<td>12 each arm</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td>Bent over Rows</td>
						<td>Back</td>
						<td>3</td>
						<td>12</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td colspan="5">Interval Trainning</td>
						
						</tr>
						
						<tr>
						<td rowspan="4">Friday</td>
						<td>Stiff leg Deadlifts</td>
						<td>Hamstrings</td>
						<td>3</td>
						<td>12</td>
						<td>1 minute</td>
						</tr>
						
						<tr>
						<td>Step ups</td>
						<td>Hams & Quads</td>
						<td>3</td>
						<td>12 each leg</td>
						<td>1 minute</td>
						
						</tr>
						<tr>
						<td>Push through</td>
						<td>ABdominals</td>
						<td>3</td>
						<td>30</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Reverse crunch</td>
						<td>Abdominal</td>
						<td>3</td>
						<td>30</td>
						<td>30 seconds</td>
						</tr>
						
						
						<tr>
						<td rowspan="3">Saturday</td>
						<td>Standing calve Raises</td>
						<td>Calf</td>
						<td>3</td>
						<td>15</td>
						<td>15 seconds</td>
						</tr>
						
						<tr>
						<td>Seated Calve Raises</td>
						<td>Calf</td>
						<td>3</td>
						<td>15</td>
						<td>15 seconds</td>
						</tr>
						<tr>
						<td colspan="5">Interval Training</td>
						
						</tr>
						</table>
						<br>
						<br>
						
				<h3>Model Gym Schedule Table for Weight Gain</h3>
						<table style="width:100%">
						
						<tr>
						<td></td>
						<th>Exercise</th>
						<td>Muscle Group</td>
						<td>Sets</td>
						<td>Reps</td>
						<td>Rest</td>
						</tr>
						
						<tr>
						<td rowspan="4">Monday</td>
						<td>Incline Dumbell Press</td>
						<td>Chest</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Inclined Flys</td>
						<td>Chest</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Dips</td>
						<td>Chest</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Tricep Pushdown</td>
						<td>Tricep</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						
						<tr>
						<td rowspan="5">Tuesday</td>
						<td>Front Squat</td>
						<td>Legs</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Good Morning</td>
						<td>Legs</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Seated Calf Raises</td>
						<td>Legs</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Hanging Crunches</td>
						<td>Abs</td>
						<td>4</td>
						<td>12-15</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td>Cable Crunch</td>
						<td>Abs</td>
						<td>4</td>
						<td>12-15</td>
						<td>45 seconds</td>
						</tr>
						
						<tr>
						<td>Wednesday</td>
						<td colspan="5">Rest Day</td>
						
						</tr>
						
						
						
						<tr>
						<td rowspan="5">Thursday</td>
						<td>Seated Military Press</td>
						<td>Shoulder</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Lateral Raises</td>
						<td>Shoulder</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						
						</tr>
						<tr>
						<td>Rivers Flyes</td>
						<td>Traps</td>
						<td>3</td>
						<td>12-15</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td>Diamond Pushups</td>
						<td>Tricep</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Tricep Kickbacks</td>
						<td>Tricep</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td rowspan="4">Friday</td>
						<td>Bend Over Rows</td>
						<td>Back</td>
						<td>4</td>
						<td>12-15</td>
						<td>1 minute</td>
						</tr>
						
						<tr>
						<td>lat pulldown</td>
						<td>Back</td>
						<td>4</td>
						<td>12-15 </td>
						<td>1 minute</td>
						
						</tr>
						<tr>
						<td>Push through</td>
						<td>Bicep</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Reverse crunch</td>
						<td>Bicep</td>
						<td>4</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Saturday and Sunday</td>
						<td colspan="5">Rest Day</td>
						
						</tr>
						</table>
						
						<br>
						<br>
						<h3>Model Gym Schedule Table for Body Building</h3>
						<table style="width:100%">
						
						<tr>
						<td></td>
						<th>Exercise</th>
						<td>Muscle Group</td>
						<td>Sets</td>
						<td>Reps</td>
						<td>Rest</td>
						</tr>
						
						<tr>
						<td rowspan="5">Monday</td>
						<td>Flat Bench Dumbell Press</td>
						<td>Chest</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Incline Dumbell Press</td>
						<td>Chest</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Wide Grip Dips</td>
						<td>Chest</td>
						<td>3</td>
						<td>12-15</td>
						<td>1 minute</td>
						</tr>
						<tr>
						<td>Dumbell Military Press</td>
						<td>Shoulder</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Dumbell Lateral Raises</td>
						<td>Shoulder</td>
						<td>3</td>
						<td>30</td>
						<td>1 minute</td>
						</tr>
						
						
						<tr>
						<td rowspan="4">Tuesday</td>
						<td>Dead Lifts</td>
						<td>Back</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Barbell bent over Rows</td>
						<td>Back</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Wide Grip Pull Ups</td>
						<td>Biceps</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Twenty Ones</td>
						<td>Biceps</td>
						<td>3</td>
						<td>7 Low,7 High,7 Full</td>
						<td>45 seconds</td>
						</tr>
						
						<tr>
						<td rowspan="3">Wednesday</td>
						<td>Leg Raises</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>V ups</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Oblique crunches</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>30 seconds</td>
						</tr>
						
						
						<tr>
						<td rowspan="5">Thursday</td>
						<td>Squats</td>
						<td>Legs</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Stiff leg Dead Lifts</td>
						<td>Legs</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						
						</tr>
						<tr>
						<td>Leg Extensions</td>
						<td>Legs</td>
						<td>3</td>
						<td>12-15</td>
						<td>45 seconds</td>
						</tr>
						<tr>
						<td>Leg Curs</td>
						<td>Legs</td>
						<td>3</td>
						<td>12</td>
						<td>45 seconds</td>
						</tr>
						
						<tr>
						<td>Calve Raises</td>
						<td>Legs</td>
						<td>3</td>
						<td>12</td>
						<td>45 seconds</td>
						</tr>
						
						
						<tr>
						<td rowspan="5">Friday</td>
						<td>Alternating Bicep Curls</td>
						<td>Arms</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						<tr>
						<td>Skull Crushers</td>
						<td>Arms</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						
						</tr>
						<tr>
						<td>Cable Bicep Curls</td>
						<td>Arms</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Cable Triceps Extensions</td>
						<td>Arms</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						<tr>
						<td>Concentrations Curls</td>
						<td>Arms</td>
						<td>3</td>
						<td>12-15</td>
						<td>30 seconds</td>
						</tr>
						
						
						<tr>
						<td rowspan="3">Saturday</td>
						<td>Hanging Weighted Leg Raises</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>1 minute</td>
						</tr>
						
						<tr>
						<td>Crunches</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>1 minute</td>
						</tr>
						<tr>
						<td>Weighted Trunk Twist</td>
						<td>Abs</td>
						<td>4</td>
						<td>20-failure</td>
						<td>1 minute</td>
						</tr>
						</table>
						
						
							</div>
	</section><!--/form-->
	<br>
	
	
<%@ include file="cfooter.jsp" %>