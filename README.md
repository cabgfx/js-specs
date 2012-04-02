Try running `/spec/requests/posts_spec.rb`.

The problem is that I get

```
expected 1 record, got 0
```

each and every time. The records are created, but not cleaned up between runs, and Capybara can't see them.

The app works when I just use it in the browser :(