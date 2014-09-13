d3.json "data/D3graph.json", (data) ->
	widthScale = d3.scale.linear()
					.domain([0,75])
					.range([0,500])
	yaxis = d3.svg.axis()
 			.scale(widthScale)
 			.orient(["top"])

	color = d3.scale.linear()
 			.domain([0,75])
 			.range(["red" , "blue"])

	canvas = d3.select(".bargraph").append("svg").attr("width", 500).attr("height", 500)
				.append("g")
				.attr("transform" , "translate(100,500) rotate(270)")
				

	

	canvas.selectAll("rect").data(data.graphDetails)
	.enter()
	.append("rect")
	.attr("class","vertbargraph")
	.attr("id","vertBar")
	.attr("width", (d) ->
		d.overall * 5)
	.attr("height", 45)
	.attr("y", (d, i) ->
    	i * 70)
	.attr("fill", "blue")

	canvas.selectAll("text").data(data.graphDetails)
	.enter()
	.append("text")
	.attr("fill", "black")
	.attr("y", (d, i) ->
		i*70)
	.text (d) ->
		d.year

	canvas.append("g")
		.attr("transform" , "translate(0,0)")
		.call(yaxis)

	canvas.selectAll("rect")
		.attr("id","vertBar")
		.on('click',->
			#alert("Hi")
			$('.bargraph').hide()
			$('.sunBurst').show())

	#changeGraph:->
		#alert("Hi")

	

