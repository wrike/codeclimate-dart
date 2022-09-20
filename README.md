# Code Climate Dart-Engine

`codeclimate-dart` is a Code Climate engine that wraps [dart code metrics](https://github.com/wrike/dart-code-metrics). You can run it on your command line using the Code Climate CLI, or on Code Climate's hosted analysis platform.

### Installation

1. If you haven't already, [install the Code Climate CLI](https://github.com/codeclimate/codeclimate).
2. Run `codeclimate engines:install dart`. This command both installs the engine and enables it in your `.codeclimate.yml` file.
3. You're ready to analyze! Browse into your project's folder and run `codeclimate analyze`.

### Test Plugin locally

1. Create docker image `docker build -t codeclimate/codeclimate-dart:latest .`
2. Test Code Climeta with your project `codeclimate analyze --dev`
You also can generate local html test report `codeclimate analyze --dev -f html > codeclimate.html`

### Need help?

For help with `metrics`, [check out their documentation](https://github.com/wrike/dart-code-metrics).

If you're running into a Code Climate issue, first look over this project's [GitHub Issues](https://github.com/tkqubo/codeclimate-tslint/issues), as your question may have already been covered.