// Generated by CoffeeScript 1.4.0

d3.json("data/D3graph.json", function(data) {
  var axis, canvas, color, widthScale;
  widthScale = d3.scale.linear().domain([0, 75]).range([0, 500]);
  axis = d3.svg.axis().scale(widthScale).orient(["top"]);
  color = d3.scale.linear().domain([0, 75]).range(["red", "blue"]);
  canvas = d3.select("body").append("svg").attr("width", 500).attr("height", 500).append("g").attr("transform", "translate(100,500) rotate(270)");
  canvas.selectAll("rect").data(data.graphDetails).enter().append("rect").attr("width", function(d) {
    return d.overall * 5;
  }).attr("height", 45).attr("y", function(d, i) {
    return i * 70;
  }).attr("fill", "blue");
  canvas.selectAll("text").data(data.graphDetails).enter().append("text").attr("fill", "black").attr("y", function(d, i) {
    return i * 70;
  }).text(function(d) {
    return d.year;
  });
  return canvas.append("g").attr("transform", "translate(0,0)").call(axis);
});
