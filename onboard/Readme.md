If you compile this code, and you have flashed the official binary of ESC32 before,
you need to clean the flash memory of the MCU and set the config again, because the format of the config data has changed.
Also the hardware is a bit different.
<br /><b>Note:</b> The PI RPM control algorithm has been reworked in integer. The default P & I coefficients are set conservative so not tuned for fast convergence, e.t. it needs 5 seconds to stabilize on a KV920 motor.
