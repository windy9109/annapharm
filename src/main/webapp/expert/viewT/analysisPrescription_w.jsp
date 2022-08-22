<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	body {
    background: #fff !important;
}
	</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			[ '연령', '남', '여' ], [ '10', 1000, 400 ],
			[ '20', 1170, 460 ], [ '30', 660, 1120 ],
			[ '40', 1030, 540 ],  [ '50', 1000, 400 ],
			[ '60', 1170, 460 ], [ '70', 660, 1120 ],
			[ '80', 1030, 540 ] ]);
		var options = {
				hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);

	}
</script>


	<div id="chart_div" style="width: 300px; height: 200px;"></div>

</div>