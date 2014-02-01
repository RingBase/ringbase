#= require jquery
#= require jquery_ujs
#
#= require bootstrap.min
#= require underscore.min

window.conn    = new WebSocket('ws://localhost:9000')
window.agentId = Math.floor(Math.random()*100) + 1
window.send = (msg) ->
  conn.send(JSON.stringify({"agent_id": agentId, "action": "broadcast", "data": msg }))

conn.onopen = ->
  conn.send(JSON.stringify({ "agent_id": agentId, "action": "login" }))

conn.onmessage = (json) ->
  data = JSON.parse(json.data)
  console.log(data)

conn.onerror = (err) ->
  console.error("Websocket error: " + err.type)
