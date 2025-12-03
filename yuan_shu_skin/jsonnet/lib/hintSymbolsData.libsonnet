{
  /*
  说明:
    长按没有区分中英文，这里pinyin会作用到中英键盘上
    pinyin9为中文九键(不是九键的皮肤就不用管)的长按数据
    number为数字九键的长按数据

  */
  pinyin: {
    // 第二行 {{{1
    a: {
      selectedIndex: 0,
      list: [
        { action: { shortcut: '#左手模式' }, label: { text: 'L' }, fontSize: 16 },
      ],
    },
    m: {
      selectedIndex: 0,
      list: [
        { action: { shortcut: '#右手模式' }, label: { text: 'R' }, fontSize: 16 },
      ],
    },
    // }}}

    // 第三行 {{{3
    v: {
      selectedIndex: 0,
      list: [
        { action: { symbol: '(' }, label: { text: '(' }, processByRIME: 'true' },
        { action: { symbol: '[' }, label: { text: '[' }, processByRIME: 'true' },
        { action: { symbol: '{' }, label: { text: '{' }, processByRIME: 'true' },
        { action: { symbol: '<' }, label: { text: '<' }, processByRIME: 'true' },
      ],
    },
    b: {
      selectedIndex: 1,
      list: [
        { action: { symbol: ')' }, label: { text: ')' }, processByRIME: 'true' },
        { action: { symbol: ']' }, label: { text: ']' }, processByRIME: 'true' },
        { action: { symbol: '}' }, label: { text: '}' }, processByRIME: 'true' },
        { action: { symbol: '>' }, label: { text: '>' }, processByRIME: 'true' },
      ],
    },

    '^_^': {
      selectedIndex: 0,
      list: [
        { action: { symbol: '~' }, label: { text: '~' }, processByRIME: 'true' },
        { action: { symbol: '`' }, label: { text: '`' }, processByRIME: 'true' },
      ],
    },
    // }}}

    // 第四行 {{{4
    enter: {
      size: { width: 70, height: 63 },
      selectedIndex: 0,
      list: [
        { action: { shortcut: '#换行' }, label: { text: 'Return' }, fontSize: 16 },
      ],
    },
    // }}}

    // 其他可用字段名:
    // 除上方已经出现的剩下26字母,
    // "backspace"(不推荐),
    // "symbol": 切到符号键盘的按键
    // "shift": 切到shift键盘的按键
    // "spaceRight": 空格右侧的按键,
  },


  number: {
    number1: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '一' }, label: { text: '一' }, fontSize: 17 },
        { action: { symbol: '壹' }, label: { text: '壹' }, fontSize: 17 },
        { action: { symbol: '➀' }, label: { text: '➀' } },
      ],
    },
    number2: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '二' }, label: { text: '二' }, fontSize: 17 },
        { action: { symbol: '贰' }, label: { text: '贰' }, fontSize: 17 },
        { action: { symbol: '➁' }, label: { text: '➁' } },
      ],
    },
    number3: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '三' }, label: { text: '三' }, fontSize: 17 },
        { action: { symbol: '叁' }, label: { text: '叁' }, fontSize: 17 },
        { action: { symbol: '➂' }, label: { text: '➂' } },
      ],
    },
    number4: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '四' }, label: { text: '四' }, fontSize: 17 },
        { action: { symbol: '肆' }, label: { text: '肆' }, fontSize: 17 },
        { action: { symbol: '➃' }, label: { text: '➃' } },
      ],
    },
    number5: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '五' }, label: { text: '五' }, fontSize: 17 },
        { action: { symbol: '伍' }, label: { text: '伍' }, fontSize: 17 },
        { action: { symbol: '➄' }, label: { text: '➄' } },
      ],
    },
    number6: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '六' }, label: { text: '六' }, fontSize: 17 },
        { action: { symbol: '陆' }, label: { text: '陆' }, fontSize: 17 },
        { action: { symbol: '➅' }, label: { text: '➅' } },
      ],
    },
    number7: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '七' }, label: { text: '七' }, fontSize: 17 },
        { action: { symbol: '柒' }, label: { text: '柒' }, fontSize: 17 },
        { action: { symbol: '➆' }, label: { text: '➆' } },
      ],
    },
    number8: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '八' }, label: { text: '八' }, fontSize: 17 },
        { action: { symbol: '捌' }, label: { text: '捌' }, fontSize: 17 },
        { action: { symbol: '➇' }, label: { text: '➇' } },
      ],
    },
    number9: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '九' }, label: { text: '九' }, fontSize: 17 },
        { action: { symbol: '玖' }, label: { text: '玖' }, fontSize: 17 },
        { action: { symbol: '➈' }, label: { text: '➈' } },
      ],
    },
    number0: {
      selectedIndex: 1,
      size: { width: 42, height: 53 },
      list: [
        { action: { symbol: '零' }, label: { text: '零' }, fontSize: 17 },
        { action: { symbol: '〇' }, label: { text: '〇' }, fontSize: 17 },
        { action: { symbol: '➉' }, label: { text: '➉' } },
      ],
    },
    // 其他可用字段名:
    // 除上方已经出现的剩下数字0-9,
    // 其他按键同上
  },
}
