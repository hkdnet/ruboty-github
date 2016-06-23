This repository was derived from increments/ruboty-qiita-github 

# Ruboty::Github
Manage GitHub via Ruboty.
This gem adds `deploy pull request` command to original ruboty-github plugin.

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
@ruboty label <URL> <labels separeted by comma>
```

## ENV
```
GITHUB_BASE_URL - Pass GitHub base URL if needed (e.g. https://github.example.com)
```
