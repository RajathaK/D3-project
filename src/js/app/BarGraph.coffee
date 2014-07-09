dataArray = [70,60,50,40,30,20]

width = 600

height = 600

#heightscale = d3.scale.linear().domain([0,70]).range([0,height])## variable used to scale the graph accordingly 

#colorscale = d3.scale.linear().domain([0,70]).range(["red","blue"])

#axis = d3.svg.axis().scale(heightscale)

canvas = d3.select("body")
.append("svg")
.attr("width", width)
.attr("height", height)
## Code to rotate and give x and y spacing
#.append("g")
#.attr("transform","translate(60,60)")
## Code to add axis on the graph
#.call(axis)

circle1 = canvas.append("circle")
.attr("cx",50)
.attr("cy",100)
.attr("r",25)

circle1.transition()
.attr("cx",200)

#circle2 = canvas.append("circle")
#.attr("cx",50)
#.attr("cy",200)
#.attr("r",25)

#cirlces = canvas.selectAll("circle")
#.data(dataArray)
#.attr("fill","red")
#.exit()
#.append("circle")
#.attr("cx",50)
#.attr("cy",50)
#.attr("fill","green")
#.attr("r",30)


###bars = canvas.selectAll("rect")
.data(dataArray)
.enter()
.append("rect")
.attr("width", 50)
.attr("height", (d) ->
	d*10)
.attr("fill", (d) ->
	d)
.attr("x", (d, i) ->
	i * 100)###