# Tuning for ETH mining

# sudo nvidia-smi -pm 1 # Persistence Mode
# sudo nvidia-xconfig --cool-bits=28
sudo nvidia-smi -pl 125 # Power Limit
sudo nvidia-smi -lgc 1250,1250
# sudo nvidia-smi -i 0 -ac 7000,1260


# nvidia-smi dmon   # monitor GPU hardware info
# nvidia-smi pmon   # To monitor per-process GPU usage
# nvidia-smi topo --matrix # view system/GPU/CPU topology

# nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=100'
########################################################################################
~/Downloads/nanominer-linux-3.3.5/nanominer ~/Downloads/nanominer-linux-3.3.5/config.ini
