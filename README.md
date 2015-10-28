# Ruboty::Github
Manage GitHub via Ruboty.

## Install
```ruby
# Gemfile
gem "ruboty-github"
```

## Usage
```
@ruboty close <URL>                                       - Close an Issue
@ruboty create issue "<title>" on <repo>[\n<description>] - Create a new Issue
@ruboty merge <URL>                                       - Merge a Pull Request
@ruboty pull request "<title>" from <from> to <to>        - Create a new Pull Request
@ruboty deploy pull request "<title>" from <from> to <to> - Create a new Pull Request for Deploy
@ruboty remember my github token <token>                  - Remember sender's GitHub access token
```

## ENV
```
GITHUB_BASE_URL - Pass GitHub base URL if needed (e.g. https://github.example.com)
```

## Image
![](https://raw.githubusercontent.com/r7kamura/ruboty-github/master/images/screenshot.png)
