$blab.drawVisualization = (options) ->
  
    # data table
    data = new vis.DataSet()
  
    # animation data
    tmax = 2.0 * pi
    tstep = tmax / 75
    dotCount = 15 # set this to 1, 2, 3, 4, ...
    t = 0

    while t < tmax
        tgroup = parseFloat(t.toFixed(2))
        value = t
    
        # a dot in the center
        data.add
            x: 0
            y: 0
            z: 0
            filter: tgroup
            style: value
    
        # one or multiple dots moving around the center
        dot = 0

        while dot < dotCount
            tdot = t + 2 * pi * dot / dotCount
            data.add
                x: sin(tdot)
                y: cos(tdot)
                z: sin(tdot)
                filter: tgroup
                style: value

            data.add
                x: sin(tdot)
                y: -cos(tdot)
                z: sin(tdot + tmax * 1 / 2)
                filter: tgroup
                style: value

            dot++
      
        t += tstep
  
    container = $ "#plot"
    graph3d = new vis.Graph3d(container[0], data, options)

