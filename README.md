# xiaomi-thermal-noroot

Stop the thermal daemon on Xiaomi (MIUI/HyperOS) devices without root, using the `miui.mqsas.IMQSNative` binder exploit method.

## How It Works

This module calls the `miui.mqsas.IMQSNative` binder service directly to stop/start thermal-related services:

- `mi_thermald`
- `thermal`
- `thermald`
- `thermalloadalgod`

If you have a service different from those mentioned above, please let me know via an issue!

## Requirements

- Xiaomi device running MIUI or HyperOS
- [AxManager](https://github.com/fahrez182/AxManager)

## Installation

1. Download the latest release `.zip` from the [Releases](../../releases) page
2. Open AxManager
3. Go to Modules → find disable-thermal_For_Xiaomi.zip and install
4. Wait for installation to finish

## Usage

1. Open AxManager
2. Find `disable thermal For xiaomi` in your modules list
3. Tap the Action button to toggle:
   - First tap  → thermal stopped (Status: On)
   - Second tap → thermal restarted (Status: Off)
4. when reboot phone, Tap the Action button to toggle:
   - 2x tap  → thermal stopped (Status: On)
   - next tap → thermal restarted (Status: Off)

### Verify Service Status

To manually check if the thermal services are actually running or stopped, run this command via AxManager's QuickShell, Brevent, or any terminal app:

```
getprop | grep -E "init.svc.(mi_thermald|thermal|thermald|thermalloadalgod)"
```

A log file will be created at:
- `/storage/emulated/0/log_on.txt` when stopped
- `/storage/emulated/0/log_off.txt` when restarted

## Uninstall

Uninstalling the module through your manager app will automatically restart all thermal services to restore default behavior.

## Disclaimer

- This module only stops services managed by init (init.svc) and does not stop the `thermal HAL` and `thermal zone`, this is purely a limitation of running without root access.
- It will not work on phones other than Xiaomi.
- Successfully tested on the Redmi 12 4g running HyperOS 2.
- Use at your own risk.

## Credits

- Author : [Keda](https://github.com/XraveMC)
- Banner artist : [S. Care](Https://www.pixiv.net/users/23239336 )
