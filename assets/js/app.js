import "../css/app.css";
import "nprogress/nprogress.css";
import "phoenix_html";
import { connectLiveViewSocket } from "./socket";
import { initializeNprogress } from "./nprogress";

initializeNprogress();
connectLiveViewSocket();
