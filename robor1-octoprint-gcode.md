```
G28; HOME
M565 Z-1.0; Z offset for autoleveling
G29; --run autoleveling
G0 Z0.2 ; Move the head to 0.2 mm
G92 Z0  ; Call this Z = 0
```
