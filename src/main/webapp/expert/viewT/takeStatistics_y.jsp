<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          ['Year', '원'],
          ['월',  1000],
          ['화',  1170],
          ['수',  660],
          ['목',  1030],
          ['금',  30]
        ]);

        var options = {
          hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>


    <div id="chart_div" style="width: 300px; height: 100px;"></div>
