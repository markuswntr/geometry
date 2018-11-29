# Geometry

[![Swift Version](https://img.shields.io/badge/Swift-4.2-red.svg)](https://swift.org/)
[![Build Status](https://travis-ci.com/markuswntr/geometry.svg?branch=master)](https://travis-ci.com/markuswntr/geometry)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ec7266e2c4574154b2e98f141eb8a479)](https://www.codacy.com/app/markuswntr/geometry)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20linux-lightgrey.svg)

Defines relative distance of figures, point, size, rectangle and their higher dimensional equivalents.
[SIMD](https://en.wikipedia.org/wiki/SIMD) on target hardware is utilized, whenever possible, to improve the performance of
mathmatical operations.

The module does depend on [markuswntr/vector](https://github.com/markuswntr/vector) and builds on macOS and Linux.

> Note: Right now, protocol extensions in [markuswntr/vector](https://github.com/markuswntr/vector) still require **<simd.h>** (as of now Apple only) to be available on the target hardware.