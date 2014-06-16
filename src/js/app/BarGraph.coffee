dataArray = [20,30,40,50,60,70]

width = 600

height = 600

heightscale = d3.scale.linear().domain([0,70]).range([0,height])

colorscale = d3.scale.linear().domain([0,70]).range(["red","blue"])

canvas = d3.select("body")
			.append("svg")
			.attr("width", width)
			.attr("height", height)
			
bars = canvas.selectAll("rect")
		.data(dataArray)
		.enter()
		.append("rect")
		.attr("width", 50)
		.attr("height", (d) ->
			heightscale d)
		.attr("fill", (d) ->
			colorscale d)
		.attr("x", (d, i) ->
			i * 100)