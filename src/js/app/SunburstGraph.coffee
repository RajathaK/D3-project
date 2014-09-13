###d3.json "data/D3graph.json", (data) ->
	
	#color = d3.scale.category20c()

 	canvas = d3.select(".sunBurst").append("svg").attr("width", 960).attr("height", 700)
				.append("g")
				.attr("transform" , "translate(480,364)")###

width = 960
height = 700
radius = Math.min(width, height) / 2
color = d3.scale.category20c()

svg = d3.select(".sunBurst").append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height * .52 + ")");

partition = d3.layout.partition()
    .sort(null)
    .size([2 * Math.PI, radius * radius])
    .value((d)->
    	return 1)

arc = d3.svg.arc()
    .startAngle((d)->
    	return d.x)
    .endAngle((d)->
    	return (d.x + d.dx))
    .innerRadius((d)->
    	return Math.sqrt(d.y))
    .outerRadius((d)->
    	return Math.sqrt(d.y + d.dy))

d3.json "BarGraph.json", (error, root)->
  	path = svg.datum(root).selectAll("path")
      	.data(partition.nodes)
    	.enter().append("path")
      	.attr("display", (d)->
      		return if d.depth then null else "none") ## hide inner ring
      	.attr("d", arc)
      	.style("stroke", "#fff")
      	.style("fill", (d)->
      		return color((if d.children then d else d.parent).name))
      	.style("fill-rule", "evenodd")
      	#.each(stash);

  d3.selectAll("input").on "change", change:->
    value = if this.value is "count" then -> return 1 else (d)-> return d.size

    path.data(partition.value(value).nodes)
      	.transition()
        .duration(1500)
        #.attrTween("d", arcTween);

## Stash the old values for transition.
###stash:(d)->
	d.x0 = d.x
  	d.dx0 = d.dx###

## Interpolate the arcs in data space.
###arcTween:(a)->
	i = d3.interpolate({
		x: a.x0, 
		dx: a.dx0
		}, a)
  	return (t)->
  		b = i(t)
    	a.x0 = b.x
    	a.dx0 = b.dx
    	return arc(b)###

d3.select(self.frameElement).style("height", height + "px");
