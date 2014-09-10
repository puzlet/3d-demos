drawVisualization = ->
  
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
  
    # options
    options =
        width: "600px"
        height: "600px"
        style: "dot-color"
        showPerspective: true
        showGrid: true
        keepAspectRatio: true
        verticalRatio: 1.0
        animationInterval: 35 # milliseconds
        animationPreload: false
        animationAutoStart: false
        legendLabel: "color value"
        cameraPosition:
            horizontal: 2.7
            vertical: 0.0
            distance: 1.65
  
    container = $ "#plot"
    graph3d = new vis.Graph3d(container[0], data, options)

data = null
graph = null

drawVisualization()

