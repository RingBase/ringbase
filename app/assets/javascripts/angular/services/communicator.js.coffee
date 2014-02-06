@RingBase.factory "Communicator", ->
  service = {}
  agentId = Math.floor(Math.random()*100) + 1

  service.connect = ->
    return if service.ws
    conn = new WebSocket('ws://localhost:9000')

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agentId, "action": "login" }))
      service.callback "Opened connection"
      return

    conn.onmessage = (json) ->
      data = JSON.parse(json.data)
      service.callback data
      return

    conn.onerror = (err) ->
      service.callback "WebSocket error" + err.type
      return

    service.conn = conn
    return

  service.send = (message) ->
    json = JSON.stringify({"agent_id": agentId, "action": "broadcast", "data": message })
    service.conn.send json
    console.log "Broadcast Sent: " + json
    return

  service.subscribe = (callback) ->
    service.callback = callback
    return

  service
