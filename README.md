# GToolkit-UI-Scripter
I am a set of utilities for input simulation


# GToolkit-Enigo

GToolkit bindings to [Enigo](https://github.com/enigo-rs/enigo) - a cross platform input simulation in Rust.

## Installation

```smalltalk 
EpMonitor current disable.
[ 
  Metacello new
    baseline: 'Enigo';
    repository: 'github://feenkcom/gtoolkit-ui-scripter/src';
    load
] ensure: [ EpMonitor current enable ].  
```
