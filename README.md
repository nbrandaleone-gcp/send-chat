# send-msg

This programs send a random phrase to a web chat program.
It was created for testing purposes, to generate useful traffic.
The phrase is converted into a JSON structure and then sent via
HTTP POST. The program waits a few seconds and then loops for
up to 100 iterations.

The chat program source code is on [GitHub](https://github.com/) here: https://github.com/nbrandaleone-gcp/kemal-redis-chat

## Installation

Follow [Crystal](https://crystal-lang.org/install/) installation instuctions.

## Usage

```bash
send-msg -u http://localhost:3000/msg"
```

Or, if you want to run the command via docker:

```bash
docker run --rm nbrand/send-msg -u <URL>
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/send-msg/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nick Brandaleone](https://github.com/your-github-user) - creator and maintainer
