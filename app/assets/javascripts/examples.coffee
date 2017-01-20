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

  if $(".london").length
    data = [
      {"year": 1801, "inner": 879491, "outer": 131666, "greater": 1011157 },
      {"year": 1811, "inner": 1040033, "outer": 157640, "greater": 1197673 },
      {"year": 1821, "inner": 1263975, "outer": 186147, "greater": 1450122 },
      {"year": 1831, "inner": 1515557, "outer": 214392, "greater": 1729949 },
      {"year": 1841, "inner": 1661346, "outer": 255667, "greater": 1917013 },
      {"year": 1851, "inner": 1995846, "outer": 290763, "greater": 2286609 },
      {"year": 1861, "inner": 2634143, "outer": 460248, "greater": 3094391 },
      {"year": 1871, "inner": 3272441, "outer": 629737, "greater": 3902178 },
      {"year": 1881, "inner": 3910735, "outer": 799225, "greater": 4709960 },
      {"year": 1891, "inner": 4422340, "outer": 1143516, "greater": 5565856 },
      {"year": 1901, "inner": 4670177, "outer": 1556317, "greater": 6226494 },
      {"year": 1911, "inner": 4997741, "outer": 2160134, "greater": 7157875 },
      {"year": 1921, "inner": 4936803, "outer": 2616723, "greater": 7553526 },
      {"year": 1931, "inner": 4887932, "outer": 3211010, "greater": 8098942 },
      {"year": 1941, "inner": 4224135, "outer": 3763801, "greater": 7987936 },
      {"year": 1951, "inner": 3680821, "outer": 4483595, "greater": 8164416 },
      {"year": 1961, "inner": 3336557, "outer": 4444785, "greater": 7781342 },
      {"year": 1971, "inner": 3030490, "outer": 4418694, "greater": 7449184 },
      {"year": 1981, "inner": 2425534, "outer": 4182979, "greater": 6608513 },
      {"year": 1991, "inner": 2625245, "outer": 4262035, "greater": 6887280 },
      {"year": 2001, "inner": 2765975, "outer": 4406061, "greater": 7172036 },
      {"year": 2011, "inner": 3231900, "outer": 4942100, "greater": 8173900 },
    ]
    `window.data = data`
    svg = d3.select('.visualization')
            .append('svg')
            .attr('width', 960)
            .attr('height', 500)
    margin = {top: 20, right: 60, bottom: 30, left: 20}
    width = 960 - margin.left - margin.right
    height = 500 - margin.top - margin.bottom
    x = d3.scaleLinear().domain([1801, 2011+10]).rangeRound([0, width])
    y = d3.scaleLinear().domain([0, 10000000]).rangeRound([height, 0])
    x_axis = d3.axisBottom()
      .scale(x)
    y_axis = d3.axisRight()
      .scale(y)

    graph_area = svg.append('g').attr('transform', "translate(#{margin.left},#{margin.top})")
    graph_area.append("g").attr("transform", "translate(#{width},0)").call(y_axis)
    graph_area.append("g").attr("transform", "translate(0,#{height})").call(x_axis)

    graph_area.selectAll('.bar')
     .data(data)
     .enter()
     .append('rect')
     .attr('class', 'bar')
     .style('fill', 'blue')
     .attr('x', (d) -> x(d.year))
     .attr('y', (d) -> y(d.greater))
     .attr('width', (x(10) - x(0)) * 0.8)
     .attr('height', (d) -> height - y(d.greater))


  if $(".matrix").length
    matrix = [
      [11975,  5871, 8916, 2868],
      [ 1951, 10048, 2060, 6171],
      [ 8010, 16145, 8090, 8045],
      [ 1013,   990,  940, 6907],
    ]
    tr = d3.select('.visualization').append('table').selectAll('tr').data(matrix).enter().append('tr')
    td = tr.selectAll('td').data((d) -> d).enter().append('td').text((d) -> d)

    data = [
      {name: "A", value: 10},
      {name: "B", value: 20},
      {name: "C", value: 30},
    ]
    d3.select(".visualization")
      .append("ul")
      .selectAll("li")
      .data(data)
      .enter()
      .append("li")
      .style("font-size", ((d) -> "#{d.value}px"))
      .text((d) -> d.name)
