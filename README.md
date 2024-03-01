# send-msg

This programs send a random phrase to a web chat program.
It was created for testing purposes, to generate useful traffic.
The phrase is converted into a JSON structure and then sent via
HTTP POST. The program waits a few (random) seconds and then loops
forever, until the user stops the program with SIGINT or SIGTERM.

The chat program source code is on [GitHub](https://github.com/) here: https://github.com/nbrandaleone-gcp/kemal-redis-chat

## Installation

Follow [Crystal](https://crystal-lang.org/install/) installation instuctions.

## Usage

```bash
crystal run src/send-chat.cr -- -u http://localhost:3000/msg
send-chat -u http://localhost:3000/msg
```

Or, if you prefer a pre-built docker container:

```bash
docker run --rm nbrand/send-chat:0.1 -u <URL>/msg
```

> [!IMPORTANT]
> You *MUST* add `/msg` to the end of URL, in order for the chat
> server to process the incoming messages.  Otherwise, the data
> hits the main web page of the chat server, and is ignored.
> 'msg' is a dedicated API endpoint that handles JSON input.

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
