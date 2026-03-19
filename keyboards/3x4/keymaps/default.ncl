let { tap, hold, td, combo, .. } = import "fak/keycode.ncl" in

let kc = tap.reg.kc in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in

# Создаём клавиши с двойным поведением
let enter_if_tapped_and_layer1_if_held = 
  tap.reg.kc.ENTER           # при тапе - Enter
  & hold.reg.layer 1          # при удержании - слой 1
  & hold.reg.behavior { timeout_ms = 200 }  # таймаут 200мс
in

let space_if_tapped_and_layer2_if_held = 
  tap.reg.kc.SPACE            # при тапе - пробел
  & hold.reg.layer 2          # при удержании - слой 2
  & hold.reg.behavior { timeout_ms = 200 }
in

{
  virtual_keys = [],

  layers = [
    [ # СЛОЙ 0
      kc.N7,    kc.N8,    kc.N9,
      kc.N4,    kc.N5,    kc.N6,
      kc.N1,    kc.N2,    kc.N3,
      kc.N0,    kc.DOT,   kc.ENTER,  # обычный Enter
      
      # Виртуальных нет
    ],
    
    [ # СЛОЙ 1 - при удержании Пробела (или правой нижней)
      kc.Q,     kc.W,     kc.E,
      kc.A,     kc.S,     kc.D,
      kc.Z,     kc.X,     kc.C,
      kc.LSFT,  TTTT,     kc.BSPC,
    ],
  ]
}