$(document).ready(function(){
	google.load("visualization", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart1);
	google.setOnLoadCallback(drawChart2);
	google.setOnLoadCallback(drawChart3);
	google.setOnLoadCallback(drawChart4);
});
	
	
	function drawChart1() {
		var data = google.visualization.arrayToDataTable([
			[ '연령', '남', '여' ], [ '10', 1000, 400 ],
			[ '20', 1170, 460 ], [ '30', 660, 1120 ],
			[ '40', 1030, 540 ],  [ '50', 1000, 400 ],
			[ '60', 1170, 460 ], [ '70', 660, 1120 ],
			[ '80', 1030, 540 ] ]);
		var options = {width : 300, // 가로 px
		height : 200, // 세로 px
		bar : {
			groupWidth : '80%' // 그래프 너비 설정 %
		},
				vAxis: {
                title: '방문자수',
                    minValue: 0,
                    maxValue: 2000
            },
            
				hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		
		
		chart.draw(data, options);

	}
	
	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
			[ '연령', '남', '여' ], [ '10', 1000, 400 ],
			[ '20', 1170, 460 ], [ '30', 660, 1120 ],
			[ '40', 1030, 540 ],  [ '50', 1000, 400 ],
			[ '60', 1170, 460 ], [ '70', 660, 1120 ],
			[ '80', 1030, 540 ] ]);
		var options = {width : 300, // 가로 px
		height : 200, // 세로 px
		bar : {
			groupWidth : '80%' // 그래프 너비 설정 %
		},
				vAxis: {
                title: '방문자수',
                    minValue: 0,
                    maxValue: 2000
            },
            
				hAxis: {title: '연령', titleTextStyle: {color: 'red'}}
				
				
				};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_y'));
		
		
		chart.draw(data, options);

	}

	function drawChart3() {
		var data = google.visualization.arrayToDataTable([
			[ '연령', '남', '여' ], [ '10', 1000, 400 ],
			[ '20', 1170, 460 ], [ '30', 660, 1120 ],
			[ '40', 1030, 540 ],  [ '50', 1000, 400 ],
			[ '60', 1170, 460 ], [ '70', 660, 1120 ],
			[ '80', 1030, 540 ] ]);
		var options = {width : 300, // 가로 px
		height : 200, // 세로 px
		bar : {
			groupWidth : '80%' // 그래프 너비 설정 %
		},

			vAxis: {
                title: '방문자수',
                    minValue: 0,
                    maxValue: 2000
                   
            },
            
            
			vAxis: {
                title: '방문자수',
                    minValue: 0,
                    maxValue: 2000
                   
            },
            
				hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_w'));
		
		
		chart.draw(data, options);

	}
	
		function drawChart4() {
		var data = google.visualization.arrayToDataTable([
			[ '연령', '남', '여' ], [ '10', 1000, 400 ],
			[ '20', 1170, 460 ], [ '30', 660, 1120 ],
			[ '40', 1030, 540 ],  [ '50', 1000, 400 ],
			[ '60', 1170, 460 ], [ '70', 660, 1120 ],
			[ '80', 1030, 540 ] ]);
		var options = {width : 300, // 가로 px
		height : 200, // 세로 px
		bar : {
			groupWidth : '80%' // 그래프 너비 설정 %
		},
				vAxis: {
                title: '방문자수',
                    minValue: 0,
                    maxValue: 2000
            },
				hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_m'));
		
		
		chart.draw(data, options);

	}