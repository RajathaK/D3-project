d3.json "data/D3graph.json", (data) ->

	axis = d3.svg.axis()
 			.scale(1000)

	color = d3.scale.linear()
 			.domain([0,data.graphDetails])
 			.range(["red" , "blue"])
	canvas = d3.select("body").append("svg").attr("width", 500).attr("height", 500)
	canvas.selectAll("rect").data(data.graphDetails)
	.enter()
	.append("rect")
	.attr("width", (d) ->
		d.overall * 5)
	.attr("height", 45)
	.attr("transform" , "translate(100,500) rotate(270)")
	.attr("y", (d, i) ->
    	i * 50)
	.attr "fill", "blue"

	canvas.selectAll("text").data(data.graphDetails)
	.enter()
	.append("text")
	.attr("fill", "white")
	.attr("y", (d, i) ->
		i * 50 + 24)
	.text (d) ->
		d.year
	
	canvas.append("g")
	.attr("transform" , "translate(100,500)")
	.call(axis); 
