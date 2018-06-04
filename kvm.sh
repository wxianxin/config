# TODO GPU passthrough
# TODO Duel Boot

# sudo apt install qemu-kvm libvirt-bin virt-manager

# qemu-img create -f qcow2 /home/xx/L/vm/kvm-win10.qcow2 40G

################################################################################
virt-install \
    --name=win10 \
    --ram=8192 \
    --cpu=host \
    --vcpus=4 \
    --os-type=windows \
    --os-variant=win10 \
    --disk /home/xx/Downloads/Windows.iso,device=cdrom,bus=ide \
    # Default
    --disk /home/xx/vm/kvm-win10.qcow2 \
    # virtio
    # --disk /home/xx/vm/kvm-win10.qcow2,bus=virtio \
    # --disk /home/xx/virtio-win.iso,device=cdrom,bus=ide \

    # --network bridge=virbr0 \
    # --graphics vnc,listen=0.0.0.0

################################################################################
# virsh list --all
# virsh start vm

# virt-viewer --connect qemu:///system


################################################################################
# virsh edit vm
