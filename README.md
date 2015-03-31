# :scream_cat: meowziq-api :scream_cat:

The Jukebox for FaithCreates Inc, is inspired by [codefirst/party-play](https://github.com/codefirst/party-play).


# Usage

```
$ git clone https://github.com/faithcreates-tuesday/meowziq-api
$ bundle install
$ bundle exec rake db:setup
$ bundle exec foreman start
```

# API

## Status Resource

### GET /status

Get status

#### Parameters

None

#### Examples

```
$ curl http://localhost:8080/status
{"text":"play"}
```

### PATCH /status

Update status

#### Parameters

- text

#### Examples

Play

```
$ curl -X PATCH -d 'text=play'  http://localhost:8080/status
{"text":"play"}
```

Skip

```
$ curl -X PATCH -d 'text=skip'  http://localhost:8080/status
{"text":"skip"}
```

Stop

```
$ curl -X PATCH -d 'text=stop'  http://localhost:8080/status
{"text":"stop"}
```

## Song Resource

### GET /songs

Get songs

#### Parameters

None

#### Examples

```
$ curl http://localhost:8080/songs
[{"id":1,"artist":null,"title":null,"deleted_at":null,"created_at":"2015-03-29T07:33:46.230Z","updated_at":"2015-03-29T07:33:46.230Z"}]
```

### POST /songs

Add a song to playlist

#### Parameters

- artist (optional)
- file
- title (optional)

#### Examples

```
$ curl -X POST -F 'file=@music.mp3' http://localhost:8080/songs
{"id":1,"artist":null,"title":null,"deleted_at":null,"created_at":"2015-03-29T07:33:46.230Z","updated_at":"2015-03-29T07:33:46.230Z"}
```

# Author

[bouzuya](https://github.com/bouzuya/) ([FaithCreates Inc.](https://github.com/faithcreates/))

# License

[MIT](LICENSE)
