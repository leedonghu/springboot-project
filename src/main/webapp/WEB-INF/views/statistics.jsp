<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>Insert title here</title>
</head>
<body>
    <canvas id="myChart" width="400" height="400"></canvas>
</body>
<script src="/js/statistics.js"></script>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    let array = new Array();
    let name = [];
    let count = [];
    let total = 0;
    <c:forEach items="${teams}" var="item">
    array.push("${item.count},${item.name}");
    total += ${item.count};
    </c:forEach>
    console.log(total);
    let teams1 = "<c:out value='${teams}'/>";
    let teams2 = '${teams[0].count}';
    for(let i=0;i<array.length; i++){
        // console.log(array[i]);
        count[i] = Math.round(array[i].split(',')[0] / total *1000) /10 ;
        name[i] = array[i].split(',')[1];
    }
    for(let i=0; i<name.length; i++){
        console.log(name[i]+","+count[i]);
    }
   
    
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [name[0], name[1],name[2], name[3], name[4], name[5]],
            datasets: [{
                label: '팀 퍼센티지',
                data: [count[0], count[1], count[2], count[3], count[4], count[5]],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
    
</html>