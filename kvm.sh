# sudo apt install qemu-kvm libvirt-bin virt-manager

# qemu-img create -f qcow2 /home/xx/L/vm/kvm-win10.qcow2 40G

virt-install \
    --name=win10 \
    --ram=8192 \
    --cpu=host \
    --vcpus=4 \
    --os-type=windows \
    --os-variant=win10 \
    --disk /home/xx/L/vm/kvm-win10.qcow2 \
    --disk /home/xx/L/Downloads/Windows.iso,device=cdrom,bus=ide \

    # --disk /usr/share/virtio-win/virtio-win.iso,device=cdrom,bus=ide \
    # --network bridge=virbr0 \
    # --graphics vnc,listen=0.0.0.0

# virsh list --allh list --all
# virsh start win10

# virt-viewer --connect qemu:///system
