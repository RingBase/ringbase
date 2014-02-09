module.exports = (config) ->
  config.set
    basePath: "../../../../../"
    frameworks: ["jasmine"]
    autoWatch: true
    browsers: ['Chrome']
    preprocessors:
      "**/*.coffee": "coffee"

    files: [
      "vendor/assets/javascripts/angular.min.js"
      "vendor/assets/javascripts/angular-*.min.js"
      "vendor/assets/javascripts/angular-mocks.min.js"
      "app/assets/javascripts/angular/main.js.coffee.erb"
      "app/assets/javascripts/angular/controllers/PhoneCtrl.js.coffee"
      "app/assets/javascripts/angular/test/unit/controllerSpec.js.coffee"
    ]

    plugins: [
      'karma-junit-reporter'
      'karma-chrome-launcher'
      'karma-firefox-launcher'
      'karma-jasmine'
    ]

    junitReporter:
      outputFile: "test_out/unit.xml"
      suite: "unit"