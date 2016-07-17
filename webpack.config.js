var ExtractTextPlugin = require("extract-text-webpack-plugin");
var CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
    entry: ["./web/static/css/app.scss", "./web/static/js/app.js"],
    output: {
        path: "./priv/static",
        filename: "js/app.js"
    },
    module: {
        loaders: [{
            test: /\.js$/,
            exclude: /node_modules/,
            loader: ["babel"],
            include: __dirname,
            query: {
                presets: ["es2015", "react"]
            }
        }, {
            test: /\.css$/,
            loader: ExtractTextPlugin.extract("style", "css")
        }, {
            test: /\.scss$/,
            loader: ExtractTextPlugin.extract("style", "css!sass?includePaths[]=" + __dirname + "/node_modules")
        }, {
            test: /\.(png|woff|woff2|eot|ttf|svg)$/,
            loader: 'url-loader?limit=100000'
        }]
    },
    resolve: {
        modulesDirectories: ["node_modules", __dirname + "/web/static/js"],
        alias: {
            phoenix_html:
            __dirname + "/deps/phoenix_html/web/static/js/phoenix_html.js",
            phoenix:
            __dirname + "/deps/phoenix/web/static/js/phoenix.js"
        }
    },
    plugins: [
        new ExtractTextPlugin("css/app.css"),
        new CopyWebpackPlugin([{
            from: "./web/static/assets"
        }])
    ],
    devServer: {
        inline: true,
        stats: 'errors-only'
    }
}
