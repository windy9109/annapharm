
      google.load("visualization", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart01);
      google.setOnLoadCallback(drawChart02);
      google.setOnLoadCallback(drawChart03);
      
      function drawChart01() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '원'],
          ['월',  1000],
          ['화',  1170],
          ['수',  660],
          ['목',  1030],
          ['금',  30]
        ]);

        var options = {width : 250, // 가로 px
		height : 190, // 세로 px
		vAxis: {
                title: '매출액',
                    minValue: 0,
                    maxValue: 2000
            },
          hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div'));
        chart.draw(data, options);
      }
      
      

      
      function drawChart02() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '원'],
          ['월',  1000],
          ['화',  1170],
          ['수',  660],
          ['목',  1030],
          ['금',  30]
        ]);

        var options = {
	width : 250, // 가로 px
		height : 190, // 세로 px
		vAxis: {
                title: '매출액',
                    minValue: 0,
                    maxValue: 2000
            },
          hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div_m'));
        chart.draw(data, options);
      }
      
      
      
     function drawChart03() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '원'],
          ['월',  1000],
          ['화',  1170],
          ['수',  660],
          ['목',  1030],
          ['금',  30]
        ]);

        var options = {
	width : 250, // 가로 px
		height : 190, // 세로 px
		vAxis: {
                title: '매출액',
                    minValue: 0,
                    maxValue: 2000
            },
          hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div_y'));
        chart.draw(data, options);
      }
      
      
      