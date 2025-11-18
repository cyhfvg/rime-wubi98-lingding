{
  /*
  说明:
    swipe_up和swipe_down为中文26键盘的划动数据
    下面对应的pinyin9(如果当前皮肤不是九键皮肤，就不用管)和number为中文九键和数字九键的划动数据
  格式说明:
    action: 必需， 格式同仓文档
    label:  非必需， 用于控制是否在按键上显示这个划动前景(也就是说不设置就不显示了)，可选text/systemImageName
    fontSize: 非必需，用于单独指定某个划动前景字符大小
    color: 非必需，用于单独指定某个划动前景字符颜色, 格式见下方q键
  */

  swipe_up: {
// 示例 {{{1
//    q: {
//      action: { character: '!' },
//      label: { text: '!' },
//      // 单独对某个键的划动前景颜色设置示例
//      color: {
//        light: { normalColor: '#121212', highlightColor: '#121212' },
//        dark: { normalColor: '#E5C07B', highlightColor: '#E5C07B' },
//      },
//    },
// }}}

    // 第一行{{{
    q: { action: { character: '!' }, label: { text: '!' } },
    w: { action: { character: '@' }, label: { text: '@' } },
    // }}}
    
    // 第二行 {{{
    k: { action: { character: ';' }, label: { text: ';' } },
    l: { action: { character: "'" }, label: { text: "'" } },
    // }}}

    // 第三行 {{{
    v: { action: { character: '(' }, label: { text: '(' } },
    b: { action: { character: ')' }, label: { text: ')' } },
    m: { action: { character: '/' }, label: { text: '/' } },
    // }}}
    
    // 第四行{{{
    spaceRight: { action: { character: '。' } },
    space: { action: { keyboardType: 'alphabetic' } },  // 如果你没加一个中英切换键，最好别改这个
    '123': { action: { shortcut: '#RimeSwitcher' } },
    // "backspace": {"action": { "character": "。" }, "label": {"text": "。"}},
    // "enter": {"action": { "shortcut": "#换行" }, "label": {"text": "。"}},
    // "symbol": {"action": { "character": "。" }, "label": {"text": "。"}},
    // }}}

  },

  swipe_down: {
    // 第二行 {{{
    a: { action: 'tab', label: { text: 'tab' }, center: { x: 0.5, y: 0.8 } },
    k: { action: { character: ':' }, label: { text: ':' } },
    l: { action: { character: '"' }, label: { text: '"' } },
    // }}}

    // 第三行 {{{
    x: { action: { shortcut: '#cut' } },
    c: { action: { shortcut: '#copy' } },
    v: { action: { shortcut: '#paste' } },
    
    m: { action: { character: '?' }, label: { text: '?' } },
    // }}}
    
    // 第四行 {{{
    '123': { action: { shortcut: '#方案切换' } },
    // }}}
  },

  // 格式和上面一致
  number_swipe_up: {
    // '1': { action: { character: '-' }, label: { text: '-' } },
  },
  number_swipe_down: {
    // '1': { action: { character: '/' }, label: { text: '/' } },
  },
}
