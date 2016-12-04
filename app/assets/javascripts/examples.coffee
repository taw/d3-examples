# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
d3 = window.d3

$ ->
  if $(".elections_2016")
    data = [
      { name: "Donald Trump", votes: 62686675, color: "#ff8c00" },
      { name: "Hillary Clinton", votes: 65240114, color: "#98abc5" },
      { name: "Gary Johnson", votes: 4460666, color: "#8a89a6" },
      { name: "Jill Stein", votes: 1440193, color: "#7b6888" },
      { name: "Evan McMullin", votes: 642386, color: "#6b486b" },
      { name: "Darrell Castle", votes: 198576, color: "#a05d56" },
    ]
    width = 960
    height = 500
    radius = Math.min(width, height) / 2

    arc = d3.arc().outerRadius(radius - 10).innerRadius(0)
    label_arc = d3.arc().outerRadius(radius - 40).innerRadius(radius - 40)
    pie = d3.pie().sort(null).value((d) -> d.votes)
    svg = d3.select('.visualization')
            .append('svg')
            .attr('width', width)
            .attr('height', height)
            .append('g')
            .attr('transform', "translate(#{width / 2},#{height / 2})")

    g = svg.selectAll('.arc')
           .data(pie(data))
           .enter()
           .append('g')
           .attr('class', 'arc')
    g.append('path')
     .attr('d', arc)
     .style('fill', (d) -> d.data.color)
    g.append('text').attr('transform', (d) -> "translate(#{ label_arc.centroid(d) })")
     .attr('dy', '.35em')
     .text((d) ->  d.data.name)
