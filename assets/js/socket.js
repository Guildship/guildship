import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";
import Hooks from "./hooks";

const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");

const liveSocket = new LiveSocket("/live", Socket, {
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.__x) {
        window.Alpine.clone(from.__x, to);
      }
    },
  },
  hooks: Hooks,
  params: { _csrf_token: csrfToken },
});

export function connectLiveViewSocket() {
  liveSocket.connect();

  // expose liveSocket on window for web console debug logs and latency simulation:
  // >> liveSocket.enableDebug()
  // >> liveSocket.enableLatencySim(1000)
  window.liveSocket = liveSocket;
}
