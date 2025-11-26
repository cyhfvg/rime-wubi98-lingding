local swipeData = import 'swipeData.libsonnet';

local custom = {  // 同字母但是不同设置的，在这里加上，会覆盖掉swipeData.libsonnet中对应的按键设置以供英文键盘使用。
  swipe_up: {
    // action同仓皮肤定义，label可选text/systemImageName, 具体见仓皮肤文档，若不想显示，可设置为text: ""
    // 第一行 {{{1
    q: { action: { symbol: '!' }, label: { text: '!' } },
    w: { action: { symbol: '@' }, label: { text: '@' } },
    // }}}

    // 第二行 {{{2
    k: { action: { symbol: ':' }, label: { text: ':' } },
    l: { action: { symbol: '"' }, label: { text: '"' } },
    m: { action: { symbol: '?' }, label: { text: '?' } },
    // }}}

    // 第三行 {{{3
    v: { action: { character: '(' }, label: { text: '(' } },
    b: { action: { character: '(' }, label: { text: ')' } },
    n: { action: { character: '.' }, label: { text: '.' } },
    // }}}

    space: { action: { keyboardType: 'pinyin' } },
  },
  swipe_down: {

    // 第二行 {{{2
    a: { action: 'tab', label: { text: 'tab' }, center: { x: 0.5, y: 0.8 } },
    k: { action: { symbol: ';' }, label: { text: ';' } },
    l: { action: { symbol: "'" }, label: { text: "'" } },
    m: { action: { symbol: '/' }, label: { text: '/' } },
    // }}}

    // 第三行 {{{3
    x: { action: { shortcut: '#cut' } },
    c: { action: { shortcut: '#copy' } },
    v: { action: { shortcut: '#paste' } },

    n: { action: { character: ',' }, label: { text: ',' } },
    // }}}

  },
};

// 下面的不要动
{
  swipe_up: swipeData.swipe_up + custom.swipe_up,
  swipe_down: swipeData.swipe_down + custom.swipe_down,
}
