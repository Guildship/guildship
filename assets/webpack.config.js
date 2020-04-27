const path = require("path");
const glob = require("glob-all");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

let PurgecssPlugin = require("purgecss-webpack-plugin");

const TailwindExtractor = (content) => {
  return content.match(/[\w-/:]+(?<!:)/g) || [];
};

const purge = new PurgecssPlugin({
  paths: glob.sync([
    path.resolve(__dirname, "../lib/guildship_web/live/**/*.ex"),
    path.resolve(__dirname, "../lib/guildship_web/templates/**/*.eex"),
    path.resolve(__dirname, "../lib/guildship_web/templates/**/*.leex"),
    path.resolve(__dirname, "../lib/guildship_web/views/**/*.ex"),
  ]),
  whitelist: ["light-mode"],
  extractors: [
    {
      extractor: TailwindExtractor,
      extensions: ["ex", "eex", "leex"],
    },
  ],
});

const nodeEnv = JSON.stringify(process.env["NODE_ENV"]);

const isProd = nodeEnv === '"production"';

const prodPlugins = [purge];

module.exports = (env, options) => {
  const devMode = options.mode !== "production";

  return {
    optimization: {
      minimizer: [
        new TerserPlugin({ cache: true, parallel: true, sourceMap: devMode }),
        new OptimizeCSSAssetsPlugin({}),
      ],
    },
    entry: {
      app: glob.sync("./vendor/**/*.js").concat(["./js/app.js"]),
    },
    output: {
      filename: "[name].js",
      path: path.resolve(__dirname, "../priv/static/js"),
      publicPath: "/js/",
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: "babel-loader",
          },
        },
        {
          test: /\.css$/,
          use: [
            MiniCssExtractPlugin.loader,
            { loader: "css-loader", options: { importLoaders: 1 } },
            "postcss-loader",
          ],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: "../css/app.css" }),
      new CopyWebpackPlugin([{ from: "static/", to: "../" }]),
      ...(isProd ? prodPlugins : []),
    ],
  };
};
