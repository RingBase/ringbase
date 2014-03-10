@RingBase.factory "Communicator", ->
  service = {}

  service.connect = (agent_id, callback=null) ->
    if service.conn?
      console.error("Already connected!")
      return

    conn = new WebSocket('ws://localhost:9000')

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agent_id, "type": "login" }))
      callback() if callback?

    conn.onmessage = (json) ->
      #console.log("GOT FROM SERVER: " + json.data)
      data = JSON.parse(json.data)
      service.callback(data)

    conn.onerror = (err) ->
      # TODO: errback?
      #service.callback("WebSocket error" + err.type)

    service.conn = conn


  # TODO: can we tag json with current agent id here? How to access?
  service.send = (json) ->
    service.conn.send(JSON.stringify(json))

  service.subscribe = (callback) ->
    service.callback = callback

  service
