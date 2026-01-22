# Ubuntu One-Way Customization Script

This is a **one-way Ubuntu customization script** that transforms a stock Ubuntu installation into a personalized, visually appealing, and power-user-ready system.  
It configures themes, icons, fonts, terminal, dock, wallpapers, and other system tweaks—all in one go.

---

## Features

- **Themes & Icons**: Orchis GTK Theme + Papirus Dark Icons  
- **Fonts**: Fira Code for UI and terminal  
- **Terminal**: ZSH with Oh-My-Zsh + Powerlevel10k prompt  
- **Dock & GNOME Tweaks**: Bottom dock, autohide, icon resizing, clock seconds enabled  
- **Wallpaper**: Preconfigured wallpaper for a modern aesthetic  
- **System Updates**: Updates and installs required packages automatically  

---

## Requirements

- Ubuntu 20.04 or later (GNOME Desktop recommended)  
- Internet connection  
- `sudo` privileges  

---

## Installation & Usage

1. Clone or download this repository:
    ```bash
    git clone <repo-url>
    cd <repo-folder>
    ```

2. Make the script executable:
    ```bash
    chmod +x customize-ubuntu.sh
    ```

3. Run the script:
    ```bash
    ./customize-ubuntu.sh
    ```

4. Log out and log back in to see all the changes.

5. For terminal setup, run:
    ```bash
    p10k configure
    ```

> **Note:** This is a **one-way script**. It modifies your system configuration and does not include an undo option.

---

## Credits

- Script Author / Customizer: `nqss_` on Discord  
- Discord: [https://discord.gg/Wed58dnxT](https://discord.gg/Wed58dnxT)  

---

## License

This project is provided as-is for personal use. Redistribution and modification are allowed with credit to `nqss_`.

---

