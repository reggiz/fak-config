let { DirectPinKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  usb_dev = {
    vendor_id = 51966,  # 0xCAFE
    product_id = 47806, # 0xBABE
    product_ver = 256,  # 0x0100
  },
  keys =
    let D = DirectPinKey in
    [
        D 35, D 32, D 14,
        D 33, D 30, D 17,
        D 13, D 31, D 16,
        D 11, D 10, D 15,
    ]

}
