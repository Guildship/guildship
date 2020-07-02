const Hooks = {};

Hooks.ReplyBodyInput = {
  initializeSimpleMDE() {
    new SimpleMDE({
      element: document.getElementById("reply-body"),
      spellChecker: false,
      toolbar: ["bold", "italic", "heading", "|", "quote"],
      status: false,
    });
  },
  mounted() {
    this.initializeSimpleMDE();
  },
};

export default Hooks;
