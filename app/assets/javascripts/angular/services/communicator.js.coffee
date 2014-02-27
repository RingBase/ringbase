@RingBase.factory "Communicator", ->
  service = {}

  service.connect = (agent_id) ->
    if service.conn?
      console.error("Already connected!")
      return

    conn = new WebSocket('ws://localhost:9000')

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agent_id, "type": "login" }))

    conn.onmessage = (json) ->
      #console.log("GOT FROM SERVER: " + json.data)
      data = JSON.parse(json.data)
      service.callback(data)

    conn.onerror = (err) ->
      # TODO: errback?
      #service.callback("WebSocket error" + err.type)

    service.conn = conn

  service.send = (message) ->
    # TODO: action
    json = JSON.stringify({"agent_id": agentId, "action": "broadcast", "data": message })
    service.conn.send(json)

  service.subscribe = (callback) ->
    service.callback = callback

  service
