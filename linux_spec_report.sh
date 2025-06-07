#!/bin/bash

FULL=false

# Parse arguments
if [[ "$1" == "--full" ]]; then
  FULL=true
fi

echo "===== Linux Laptop Full Spec Report ($([[ $FULL == true ]] && echo "Full" || echo "Sanitized")) ====="
echo ""

# OS and Kernel
echo "--- OS and Kernel ---"
if $FULL; then
  hostnamectl
else
  lsb_release -ds 2>/dev/null || grep PRETTY_NAME /etc/os-release
  uname -r
fi
echo ""

# CPU Info
echo "--- CPU Info ---"
lscpu
echo ""

# RAM Info
echo "--- RAM Info ---"
free -h
if $FULL; then
  echo "Detailed RAM layout (may include serial numbers):"
  sudo dmidecode --type 17 2>/dev/null || echo "dmidecode not available or not permitted"
fi
echo ""

# Disk Info
echo "--- Disk Info ---"
lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,MODEL
if $FULL; then
  echo "Disk usage:"
  df -h
fi
echo ""

# GPU Info
echo "--- GPU Info ---"
lspci | grep -i vga
glxinfo | grep "OpenGL renderer" 2>/dev/null || echo "glxinfo not available"
echo ""

# Power Profile (optional)
if command -v system76-power &> /dev/null; then
  echo "--- Power Profile ---"
  system76-power graphics
  echo ""
fi

# Network Info
if $FULL; then
  echo "--- Network Info ---"
  ip a
  lspci | grep -i network
  echo ""
fi

# USB Devices
echo "--- USB Devices ---"
lsusb
echo ""

# PCI Devices
echo "--- PCI Devices ---"
lspci
echo ""

echo "===== End of $([[ $FULL == true ]] && echo "Full" || echo "Sanitized") Report ====="
