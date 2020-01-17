# GToolkit-UI-Scripter
I am a set of utilities for input simulation


# GToolkit-Enigo ![](https://github.com/feenkcom/gtoolkit-ui-scripter/workflows/Cargo%20Build/badge.svg)

GToolkit bindings to [Enigo](https://github.com/enigo-rs/enigo) - a cross platform input simulation in Rust.

## Installation

```smalltalk 
EpMonitor current disable.
[ 
  Metacello new
    baseline: 'GToolkitEnigo';
    repository: 'github://feenkcom/gtoolkit-ui-scripter/src';
    load
] ensure: [ EpMonitor current enable ].  
```
