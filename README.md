# cdwmblocks

Build of `dwmblocks`.

## Table of contents
  - [Requirements <a name="requirements"></a>](#requirements-)
  - [Installation <a name="installation"></a>](#installation-)
  - [Usage <a name="usage"></a>](#usage-)
  - [Contributing <a name="contributing"></a>](#contributing-)
  - [License <a name="license"></a>](#license-)

## Requirements <a name="requirements"></a>

In order to build `dwmblocks` you need the `Xlib` header files and [libxft-bgra][1].

## Installation <a name="installation"></a>

You must apply the appropiate patch (depending on whether you already patched dwm with the systray patch or not) to dwm (see `patches` folder).

Then, you need to run:

```bash
make clean install
```

## Usage <a name="usage"></a>

To run `cdwmblocks`:

```bash
dwmblocks
```

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/cdwmblocks/master/LICENSE)

[1]: https://aur.archlinux.org/packages/libxft-bgra

