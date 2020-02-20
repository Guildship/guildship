import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";

const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");

export function connectLiveViewSocket() {
  const liveSocket = new LiveSocket("/live", Socket, {
    params: { _csrf_token: csrfToken }
  });

  liveSocket.connect();

  return liveSocket;
}

export function connectSocket() {
  const socket = new Socket("/socket", {
    params: { token: window.userToken }
  });

  socket.connect();

  return socket;
}
