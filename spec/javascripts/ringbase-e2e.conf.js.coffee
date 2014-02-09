module.exports = (config) ->
  config.set
    basePath: "../../"
    files: ["spec/javascripts/e2e/*.js.coffee"]
    autoWatch: false
    browsers: ["Chrome"]
    frameworks: ["ng-scenario"]
    singleRun: true
    proxies:
      "/": "http://localhost:8000/"

    plugins: [
      "karma-junit-reporter"
      "karma-chrome-launcher"
      "karma-firefox-launcher"
      "karma-jasmine"
      "karma-ng-scenario"
      "karma-coffee-preprocessor"
    ]
    junitReporter:
      outputFile: "test_out/e2e.xml"
      suite: "e2e"