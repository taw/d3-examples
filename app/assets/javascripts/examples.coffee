# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
d3 = window.d3

$ ->
  if $(".elections_2016").length
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

  if $(".eu_population").length
    data = [
      {"code":"AU", "name":"Austria","population":8700471},
      {"code":"BE", "name":"Belgium","population":11289853},
      {"code":"BG", "name":"Bulgaria","population":7153784},
      {"code":"HR", "name":"Croatia","population":4190669},
      {"code":"CY", "name":"Cyprus","population":848319},
      {"code":"CZ", "name":"Czech Republic","population":10553843},
      {"code":"DK", "name":"Denmark","population":5707251},
      {"code":"EE", "name":"Estonia","population":1315944},
      {"code":"FI", "name":"Finland","population":5487308},
      {"code":"FR", "name":"France","population":66661621},
      {"code":"DE", "name":"Germany","population":82162000},
      {"code":"GR", "name":"Greece","population":10793526},
      {"code":"HU", "name":"Hungary","population":9830485},
      {"code":"IE", "name":"Ireland","population":4658530},
      {"code":"IT", "name":"Italy","population":60665551},
      {"code":"LZ", "name":"Latvia","population":1968957},
      {"code":"LT", "name":"Lithuania","population":2888558},
      {"code":"LU", "name":"Luxembourg","population":576249},
      {"code":"MT", "name":"Malta","population":434403},
      {"code":"NL", "name":"Netherlands","population":16979120},
      {"code":"PL", "name":"Poland","population":37967209},
      {"code":"PT", "name":"Portugal","population":10341330},
      {"code":"RO", "name":"Romania","population":19759968},
      {"code":"SK", "name":"Slovakia","population":5426252},
      {"code":"SI", "name":"Slovenia","population":2064188},
      {"code":"SP", "name":"Spain","population":46438422},
      {"code":"SW", "name":"Sweden","population":9851017},
      {"code":"UK", "name":"United Kingdom","population":65341183},
    ]

    svg = d3.select('svg')
    margin =
      top: 20
      right: 20
      bottom: 30
      left: 40
    width = 960 - margin.left - margin.right
    height = 500 - margin.top - margin.bottom
    svg = d3.select('.visualization')
            .append('svg')
            .attr('width', 960)
            .attr('height', 500)
    x = d3.scaleBand().rangeRound([0, width]).padding(0.1)
    y = d3.scaleLinear().rangeRound([height, 0])
    g = svg.append('g').attr('transform', "translate(#{margin.left},#{margin.top})")
    x.domain(data.map((d) -> d.code))
    console.log(data.map((d) -> d.code))
    y.domain([0, d3.max(data, (d) -> d.population / 1000000)])
    g.append('g')
     .attr('class', 'axis axis--x')
     .attr('transform', "translate(0,#{height})")
     .call(d3.axisBottom(x))
    g.append('g')
     .attr('class', 'axis axis--y')
     .call(d3.axisLeft(y).ticks(10))
     .append('text')
     .attr('transform', 'rotate(-90)')
     .attr('y', 6)
     .attr('dy', '0.71em')
     .attr('text-anchor', 'end')
     .text('Population')
    g.selectAll('.bar')
     .data(data)
     .enter()
     .append('rect')
     .attr('class', 'bar')
     .style('fill', 'blue')
     .attr('x', (d) -> x(d.code))
     .attr('y', (d) -> y(d.population/1000000))
     .attr('width', x.bandwidth())
     .attr('height', (d) -> height - y(d.population/1000000))
