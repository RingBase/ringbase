module.exports = (config) ->
  config.set
    basePath: "../../"
    frameworks: ["jasmine"]
    autoWatch: true
    browsers: ["Chrome"]
    preprocessors:
      "**/*.coffee": "coffee"

    files: [
      "vendor/assets/javascripts/angular.min.js"
      "vendor/assets/javascripts/angular-mocks.min.js"
      "vendor/assets/javascripts/angular-*.min.js"
      "app/assets/javascripts/angular/main.js.coffee"
      "app/assets/javascripts/angular/controllers/PhoneCtrl.js.coffee"
      "app/assets/javascripts/angular/services/communicator.js.coffee"
      "spec/javascripts/unit/controllerSpec.js.coffee"
    ]

    exclude: [                                                         
      "vendor/assets/javascripts/angular-scenario.min.js"
    ]

    plugins: [
      "karma-junit-reporter"
      "karma-chrome-launcher"
      "karma-firefox-launcher"
      "karma-jasmine"
      "karma-coffee-preprocessor"
    ]

    junitReporter:
      outputFile: "test_out/unit.xml"
      suite: "unit"