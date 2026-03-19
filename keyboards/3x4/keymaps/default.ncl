let { tap, hold, combo, .. } = import "fak/keycode.ncl" in
# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
let me = tap.custom.media in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in

# "cu" for custom keys. This is just a name, so it can be whatever you want.
let cu = {
  # Again, these are just names. They don't have to be 4-letter or capitalized.
  COPY = tap.reg.mod.lctl & kc.C,
  PSTE = tap.reg.mod.lctl & kc.V,
  CUT =  tap.reg.mod.lctl & kc.X,
  CLOS = tap.reg.mod.lalt & kc.F4,

  # Yep. Such names are possible in Nickel.
  ":P" = tap.reg.mod.lctl & tap.reg.mod.lalt & kc.DEL,

  # Screenshot
  SCSH = tap.reg.mod.lgui & tap.reg.mod.lsft & kc.S,
} in

{
  # Комбо для переключения слоёв
  virtual_keys = [
    combo.make 42 [9, 10],  # 0-я и .-я клавиши
  ],

  layers = [
    [ # СЛОЙ 0 - цифры
      kc.KP_7, kc.KP_8, kc.KP_9,
      kc.KP_4, kc.KP_5, kc.KP_6,
      kc.KP_1, kc.KP_2, kc.KP_3,
      kc.KP_0, kc.KP_DOT, kc.KP_ENTER,

      tap.layer.TO 1,
    ],
    
    [ # СЛОЙ 1 - WOT
      kc.X, kc.W, kc.C,
      kc.A, kc.S, kc.D,
      kc.N4, kc.N5, kc.N6,
      kc.N7, kc.N8, kc.N9,
      
      tap.layer.TO 2,
    ],

    [ # СЛОЙ 2 - Functional
      cu.SCSH, cu.CLOS, cu.":P",
      me.VOLD, me.VOLU, me.MUTE,
      me.PREV,  me.PLAY, me.NEXT,
      cu.COPY, cu.CUT, cu.PSTE, 

      tap.layer.TO 0,
    ],
  ]
}
