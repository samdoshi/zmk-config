![](keymap/corneish_zen.svg)

## Using `zmk` forks

Add the fork to `config/west.yml`, but make sure to set the `path` to something unique (in this example `seth-milliken`):

```yaml
  remotes:
    - name: SethMilliken
      url-base: https://github.com/SethMilliken
  projects:
    - name: zmk
      remote: SethMilliken
      revision: zen-display-patches
      path: seth-milliken
      import: app/west.yml
```

Then in the build script use that `path` instead of `zmk`, e.g.:

```bash
west build \
  --build-dir "build/left" \
  --board "corneish_zen_left//zmk" \
  --source seth-milliken/app \
  -- \
  -DZMK_CONFIG=/app/config
```
