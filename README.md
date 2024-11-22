# Android device tree for Google Pixel 8/8 Pro (shiba/husky)
![OFRP](https://i.ibb.co/4WgF7pR/banner-2.png "OFRP")

OrangeFox Recovery Project (OFRP) for Pixel 8/8 Pro
======================================

# How to build
Check OFRP official guide https://wiki.orangefox.tech/en/dev/building

The Pixel 8 (codenamed "shiba") and Pixel 8 Pro (codenamed "husky") are Google’s flagship smartphones for 2023. Announced and released in October 2023, both models showcase Google’s latest AI-driven features, powered by the custom-built Tensor G3 chipset (internally codenamed "zuma"). Both devices share a common hardware base and a unified source code tree, collectively referred to as "shusky." The Pixel 8 is a more compact option, while the Pixel 8 Pro offers a larger, advanced display along with additional hardware features optimized for professional-grade photography.

## Working
- **Update_engine** — installation of `payload.bin` format firmware
- **Sideload**
- **Display** — displays correctly
- **Touchscreen** — touch functionality is operational
- **A/B Slot Switching** — works properly both after installation and in manual mode
- **Reflash Current Recovery** — custom code implemented for recovery reflashing
- **MTP** — file transfer over MTP
- **ADB** — Working

## Not Working
- **/data Decryption** — data decryption is non-functional due to Tensor architecture limitations and is unlikely to be resolved. Use DFE-NEO to disable encryption; this file will be included in the release alongside `OrangeFox.img`.


## Device specifications

| Feature     | Specification
| :-----------|:-------------
| Chipset     | Google Tensor G3 (4 nm)
| CPU         | Nona-core (1x3.0 GHz Cortex-X3 & 4x2.45 GHz Cortex-A715 & 4x2.15 GHz Cortex-A510)
| GPU         | Immortalis-G715s MC10
| Memory      | (8GB Shiba)/(12GB Husky) LPDDR5 RAM
| Storage     | (128/256 Shiba)/(128/256/512 GB/1 TB Husky) (UFS 3.1)
| SIM         | Nano-SIM and eSIM
| Battery     | Li-Ion 4575 mAh (non-removable), (30Ws Husky)/(27W Shiba) wired, PD3.0, (23W Husky)/(18W Shiba) wireless, Reverse wireless
| Shipped OS  | Android 14, upgradable to Android 15, up to 7 major Android upgrades
| Dimensions  | (162.6 x 76.5 x 8.8 mm (6.40 x 3.01 x 0.35 in) Husky)/(150.5 x 70.8 x 8.9 mm (5.93 x 2.79 x 0.35 in) Shiba)
| Display     | (6.7", 1344x2992 pixels, LTPO OLED, 120Hz, HDR10+, 1600 nits (HBM), 2400 nits (peak) - Husky)/(6.2", 1080x2400 pixels, OLED, 120Hz, HDR10+, 1400 nits (HBM), 2000 nits (peak) - Shiba)
| Camera      | (50 MP, f/1.7, 25mm (wide), 1/1.31", 1.2µm, dual pixel PDAF, OIS 48 MP, f/2.8, 113mm (periscope telephoto), 1/2.55", 0.7µm, dual pixel PDAF, OIS, 5x optical zoom Husky)/(50 MP (12 MP eff.), f/1.7, 25mm (wide), 1/1.31", 1.2µm, dual pixel PDAF, OIS  Shiba)
| Comms       | Wi-Fi 802.11 a/b/g/n/ac/6e/7, tri-band, Wi-Fi Direct Bluetooth	5.3, A2DP, LE, aptX HD
| Sensors     | Fingerprint (under display, optical), accelerometer, gyro, proximity, compass, barometer

## Device picture

![POCO F5](https://static1.anpoimages.com/wordpress/wp-content/uploads/wm/2023/10/google-pixel-8-and-google-pixel-8-pro-back.jpg?q=70&fit=crop&w=1100&h=618&dpr=1)