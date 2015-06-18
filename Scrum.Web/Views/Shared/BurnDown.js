function createBurnDown(burnDownSprint, elementId) {
    var lineChartData = {
        labels: burnDownSprint.Legenda,
        datasets: [
            {
                label: "Desempenho",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: burnDownSprint.Desempenho
            },
            {
                label: "Meta Ideal",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(255, 0, 0, 1)",
                pointColor: "rgba(255, 0, 0, 1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(255, 0, 0, 1)",
                data: burnDownSprint.Meta

            }
        ]

    };

    var ctx = document.getElementById(elementId).getContext("2d");
    window.myLine = new Chart(ctx).Line(lineChartData, {
        responsive: true
    });
}