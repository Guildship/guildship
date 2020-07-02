const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  theme: {
    extend: {
      colors: {
        fog: {
          "100": "#f1f1f1",
          "200": "#dbdbdb",
          "300": "#c6c6c6",
          "400": "#9b9b9b",
          "500": "#707070",
          "600": "#656565",
          "700": "#434343",
          "800": "#323232",
          "900": "#222222",
        },
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      screens: {
        "light-mode": { raw: "(prefers-color-scheme: light)" },
      },
    },
  },
  variants: {
    borderWidth: ["responsive", "last", "hover", "focus"],
  },
  plugins: [require("@tailwindcss/ui")],
};
