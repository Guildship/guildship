import NProgress from "nprogress";

export function initializeNprogress() {
  // Show progress bar on live navigation and form submits
  window.addEventListener("phx:page-loading-start", (info) =>
    NProgress.start()
  );
  window.addEventListener("phx:page-loading-stop", (info) => NProgress.done());
}
