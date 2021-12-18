# Tuning for ETH mining

# https://github.com/NVIDIA/nvidia-settings/issues/65#issuecomment-832921061
# nvidia-settings GUI fails, CLI fails, GWE fails
# fixed by adding to /etc/X11/Xwrapper.config:
    # allowed_users=anybody
    # needs_root_rights=yes



# sudo nvidia-smi -pm 1 # Persistence Mode
# sudo nvidia-xconfig --cool-bits=28
# sudo nvidia-smi -pl 125 # Power Limit
sudo nvidia-smi -lgc 1000,1060 # --lock-gpu-clocks=MIN_GPU_CLOCK,MAX_GPU_CLOCK
# sudo nvidia-smi -i 0 -ac 7000,1260


# nvidia-smi dmon   # monitor GPU hardware info
# nvidia-smi pmon   # To monitor per-process GPU usage
# nvidia-smi topo --matrix # view system/GPU/CPU topology
NVIDIA_MEM_OFFSET=1036
NVIDIA_CLOCK_OFFSET=-800
# nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=${NVIDIA_MEM_OFFSET} -a [gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=${NVIDIA_CLOCK_OFFSET}
nvidia-settings -c :1 -a [gpu:0]/GPUMemoryTransferRateOffset[3]=${NVIDIA_MEM_OFFSET}
# nvidia-settings -c :1 -a [gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=300
# # -c :0 -> here tell Xorg which display it is attached to


# https://www.simonmott.co.uk/2017/07/ethereum-mining-nvidia-linux/
########################################################################################
~/Downloads/nanominer-linux-3.5.1-cuda11/nanominer ~/Downloads/nanominer-linux-3.5.1-cuda11/config.ini
