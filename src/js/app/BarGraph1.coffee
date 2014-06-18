d3.json "data/D3graph.json", (data) ->
	canvas = d3.select("body").append("svg").attr("width", 1000).attr("height", 1000)
	canvas.selectAll("rect").data(data.graphDetails)
	.enter()
	.append("rect")
	.attr("width", (d) ->
		d.overall * 10)
	.attr("height", 45)
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
