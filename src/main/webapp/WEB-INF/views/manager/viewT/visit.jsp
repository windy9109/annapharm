<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
   	<style>
	body {
    background: #fff !important;
}
	</style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '약사의사 방문자', '일반 방문자'],
          ['월',  1000, 600],
          ['화',  1170, 2300],
          ['수',  660, 300],
          ['목',  1030, 423],
          ['금',  30, 342]
        ]);

        var options = {
          hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

<meta charset="UTF-8">
</head>
<body>
	<div id="chart_div" style="width: 300px; height: 140px;"></div>
</body>
</html>


