# linux_sysetm_report
Linux System Full Spec Report

# Linux Laptop Spec Reporter (Sanitized + Full Mode)

This script generates a system information report for **any Linux laptop**. By default, it collects essential system details in **sanitized mode**, avoiding any personal or sensitive data.

Optionally, you can run it with the `--full` flag to include things like hostnames, IP addresses, RAM serial numbers, and more.

## 🔍 What It Reports

### ✅ Sanitized Mode (default)
- OS and kernel version (hostname excluded)
- CPU architecture and specs
- RAM usage summary
- Disk and partition layout
- GPU model and OpenGL renderer
- USB and PCI device listings
- Power profile (if `system76-power` is installed)

### 🔐 Full Mode (`--full` flag)
Includes everything above, **plus**:
- Hostname and full OS metadata
- Network info (IP and MAC addresses)
- Detailed RAM layout (serial numbers, slots)
- Mounted file systems and disk usage

---

## 🛠️ Dependencies

The script uses standard Linux command-line tools:

- `lsb_release`
- `lscpu`
- `lsblk`
- `glxinfo` (from `mesa-utils`, optional)
- `system76-power` (optional, safe to skip)
- `lsusb`
- `lspci`
- `dmidecode` (only needed for `--full`)

Install them on Debian/Ubuntu-based distros:

```bash
sudo apt update
sudo apt install lsb-release mesa-utils pciutils usbutils dmidecode

