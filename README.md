# dingux-qemu
OpenDingux on QEMU with Docker  
It's just tiny scripts to be easier preparing.  
  
Almost code is quoted from below:  
http://prizma.bmstu.ru/~exmortis/posts/2015-04-23-opendingux-qemu.html

## Usage
    git clone https://github.com/gitcrtn/dingux-qemu.git
    cd dingux-qemu
    chmod +x *.sh

    # build kernel and rootfs
    ./run_build_fs.sh

    # generate disk image by rootfs binary
    sudo ./gen_image.sh

    # launch qemu with disk image
    ./run_qemu.sh

## Requirements
Docker  
qemu-system-mipsel

## License
[MIT](https://github.com/gitcrtn/dingux-qemu/blob/master/LICENSE)

## Author
[Carotene](https://github.com/gitcrtn)
