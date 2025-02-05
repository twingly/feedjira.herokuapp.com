# Feedjira app

Fetches and parses RSS feeds and returns the data in JSON. Uses [Feedjira](https://github.com/feedjira/feedjira).

## Develop

    bundle
    foreman start

## Deploy

The master branch at GitHub is deployed automatically.

    git push

## Example usage

https://feedjira.herokuapp.com/?url=https://blogs.msdn.microsoft.com/feed/

Useful with a JSON viewer, like [the one in Firefox](https://developer.mozilla.org/en-US/docs/Tools/JSON_viewer).

## Note about gems

Gems are vendored into `vendor/cache`, you should always check in the gems when changing gems. The caching was set up with [`bundle package`](https://bundler.io/man/bundle-package.1.html).

You can use `bundle install --local` to install only from cache (e.g. you find yourself without internet connection).

## License

The MIT License (MIT)

Copyright (c) Twingly AB

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
